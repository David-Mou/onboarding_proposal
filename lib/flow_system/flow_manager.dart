import 'flow_state.dart';
import 'flow_state_event.dart';

typedef FlowListener = void Function(FlowStateEvent);

abstract class FlowManager<STATE> {
  final List<FlowState> _flowStates = [];
  final Map<String, dynamic> state = {};
  late FlowState _currentFlowState;
  FlowListener? _listener;

  FlowState get currentFlowState => _currentFlowState;

  void init(FlowState flowState) {
    _flowStates.clear();
    state.clear();
    _push(flowState);
  }

  FlowStateEvent attach() => FlowStateEvent(event: FlowStateEvents.push, state: _currentFlowState);

  FlowStateEvent detach() => FlowStateEvent(event: FlowStateEvents.pop, state: _currentFlowState);

  void _push(FlowState _flowState) {
    _currentFlowState = _flowState;
    _flowStates.add(_flowState);
    _listener?.call(attach());
  }

  void _pop() {
    final removed = _flowStates.removeLast();
    state.remove(removed.flowKey);
    _currentFlowState = _flowStates.last;
    _listener?.call(detach());
  }

  Future<void> next(dynamic value) async {
    state[_currentFlowState.flowKey] = value;
    final nextState = await _currentFlowState.resolveNextState();
    if (nextState != null) _push(nextState);
  }

  void back() => _pop();

  void listen(FlowListener newListener) {
    _listener = newListener;
  }

  Future<void> finish() async {
    await onFinish();
    dispose();
  }

  void dispose() {
    _listener = null;

    for (var flowState in _flowStates) {
      flowState.dispose();
    }

    _flowStates.clear();
  }

  Future<void> onFinish();
}

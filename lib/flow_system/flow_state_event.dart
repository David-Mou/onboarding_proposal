import 'flow_state.dart';

enum FlowStateEvents { push, pop }

class FlowStateEvent {
  final FlowStateEvents event;
  final FlowState state;

  FlowStateEvent({required this.event, required this.state});
}

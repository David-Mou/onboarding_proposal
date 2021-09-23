import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'flow_manager.dart';
import 'flow_state_event.dart';

class FlowManagerNotifier extends StateNotifier<FlowStateEvent> {
  final FlowManager manager;

  FlowManagerNotifier(this.manager) : super(manager.attach()) {
    manager.listen(_onNewState);
  }

  void _onNewState(FlowStateEvent flowState) {
    state = flowState;
  }
}

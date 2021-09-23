import 'package:flutter/widgets.dart';

import 'flow_manager.dart';

abstract class FlowState {
  final FlowManager manager;
  final String flowKey;

  FlowState({required this.flowKey, required this.manager});

  Widget buildFlowScreen() {
    return Builder(key: ValueKey(flowKey), builder: (context) => build(context));
  }

  FlowState? resolveNextState() => null;

  Widget build(BuildContext context);

  void dispose() {}
}

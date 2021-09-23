import 'package:flutter/widgets.dart';

import 'flow_manager.dart';

abstract class FlowState {
  final FlowManager manager;
  final String flowKey;

  FlowState({required this.flowKey, required this.manager});

  FlowState? next();

  Widget onBuildFlowScreen(BuildContext context);

  Widget buildFlowScreen() {
    return Builder(key: ValueKey(flowKey), builder: (context) => onBuildFlowScreen(context));
  }

  void dispose() {}
}

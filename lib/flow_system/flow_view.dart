import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_proposal/flow_system/flow_state_event.dart';

typedef OnTransitionBuilder = Widget Function(FlowStateEvents, Widget, Widget, Animation<double>);

class FlowView extends ConsumerWidget {
  final FlowStateEvent flowStateEvent;
  late final OnTransitionBuilder _onTransitionBuilder;

  FlowView({
    Key? key,
    required this.flowStateEvent,
    onTransitionBuilder,
  }) : super(key: key) {
    _onTransitionBuilder = onTransitionBuilder ?? _onTransition;
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final flowState = flowStateEvent.state;
    final flowEvent = flowStateEvent.event;
    final screen = flowState.buildFlowScreen();

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      transitionBuilder: (child, animation) => _onTransitionBuilder(flowEvent, screen, child, animation),
      child: screen,
    );
  }

  Widget _onTransition(FlowStateEvents flowEvent, Widget current, Widget child, Animation<double> animation) {
    final double offsetChildModifier = child == current ? 1 : -1;
    final double offsetEventModifier = flowEvent == FlowStateEvents.push ? 1 : -1;

    final begin = Offset(offsetEventModifier * offsetChildModifier, 0);
    const end = Offset(0, 0);

    return SlideTransition(
      position: Tween<Offset>(begin: begin, end: end).animate(animation),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_proposal/flow_system/flow_state_event.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_on_boarding_manager.dart';

class OnBoarding extends ConsumerWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final flowStateEvent = watch(soccerOnBoardingProvider);
    final flowState = flowStateEvent.state;
    final flowEvent = flowStateEvent.event;
    final screen = flowState.buildFlowScreen();

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      transitionBuilder: (child, animation) => _onTransition(flowEvent, screen, child, animation),
      child: screen,
    );
  }

  Widget _onTransition(FlowStateEvents flowEvent, Widget current, Widget child, Animation<double> animation) {
    final double offsetChildModifier = child == current ? 1 : -1;
    final double offsetEventModifier = flowEvent == FlowStateEvents.push ? 1 : -1;

    final begin = Offset(offsetEventModifier * offsetChildModifier, 0);
    final end = Offset(0, 0);

    return SlideTransition(
      position: Tween<Offset>(begin: begin, end: end).animate(animation),
      child: child,
    );
  }
}

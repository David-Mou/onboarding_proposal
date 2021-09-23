import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_on_boarding_manager.dart';

class OnBoarding extends ConsumerWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final flowStateEvent = watch(soccerOnBoardingProvider);
    final flowState = flowStateEvent.state;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: flowState.buildFlowScreen(),
    );
  }
}

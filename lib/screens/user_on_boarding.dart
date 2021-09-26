import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_proposal/flow_system/flow_view.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_on_boarding_manager.dart';

class UserOnBoarding extends ConsumerWidget {
  const UserOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final flowStateEvent = watch(soccerOnBoardingProvider);

    return FlowView(flowStateEvent: flowStateEvent);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_proposal/flow_system/flow_view.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_user_on_boarding_manager.dart';

class SoccerTeamCityQuestionScreen extends ConsumerWidget {
  final UserIteration userIteration;

  const SoccerTeamCityQuestionScreen({Key? key, required this.userIteration}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final flowStateEvent = watch(userSoccerOnBoardingProvider(userIteration));

    return FlowView(flowStateEvent: flowStateEvent);
  }
}

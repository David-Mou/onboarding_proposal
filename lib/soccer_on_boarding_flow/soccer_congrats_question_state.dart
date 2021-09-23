import 'package:flutter/material.dart';
import 'package:onboarding_proposal/flow_system/flow_state.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_country_question_state.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_team_question_state.dart';

import 'soccer_on_boarding_manager.dart';

class SoccerCongratsState extends FlowState {
  static const String key = "congrats";

  SoccerCongratsState(SoccerOnBoardingManager manager) : super(flowKey: key, manager: manager);

  @override
  Widget onBuildFlowScreen(BuildContext context) {
    final team = manager.state[SoccerTeamQuestionState.key];
    final country = manager.state[SoccerCountryQuestionState.key];

    return Scaffold(
      key: const ValueKey(key),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Uah! Coming from $country, makes totally sense you support $team"),
            TextButton(child: const Text("Finish"), onPressed: () => manager.finish()),
          ],
        ),
      ),
    );
  }

  @override
  FlowState? next() => null;
}

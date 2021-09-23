import 'package:flutter/material.dart';
import 'package:onboarding_proposal/flow_system/flow_state.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_country_question_state.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_on_boarding_manager.dart';

class SoccerTeamQuestionState extends FlowState {
  static const String key = "team";

  SoccerTeamQuestionState(SoccerOnBoardingManager manager) : super(flowKey: key, manager: manager);

  @override
  Widget onBuildFlowScreen(BuildContext context) {
    return Scaffold(
      key: const ValueKey(key),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("What is your favorite team?"),
            TextButton(child: const Text("Deportivo"), onPressed: () => manager.next("Deportivo")),
            TextButton(child: const Text("Celta"), onPressed: () => manager.next("Celta")),
          ],
        ),
      ),
    );
  }

  @override
  FlowState? next() => SoccerCountryQuestionState(manager as SoccerOnBoardingManager);
}

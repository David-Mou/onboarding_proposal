import 'package:flutter/material.dart';
import 'package:onboarding_proposal/flow_system/flow_state.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_congrats_question_state.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_on_boarding_manager.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_team_question_state.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_wtf_question_state.dart';

class SoccerCountryQuestionState extends FlowState {
  static const String key = "country";

  SoccerCountryQuestionState(SoccerOnBoardingManager manager) : super(flowKey: key, manager: manager);

  @override
  Widget onBuildFlowScreen(BuildContext context) {
    return Scaffold(
      key: const ValueKey(key),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Where are you from?"),
            TextButton(child: const Text("A Coruña"), onPressed: () => manager.next("A Coruña")),
            TextButton(child: const Text("Vigo"), onPressed: () => manager.next("Vigo")),
          ],
        ),
      ),
    );
  }

  @override
  FlowState? next() {
    final team = manager.state[SoccerTeamQuestionState.key];
    final country = manager.state[key];

    if (team == "Deportivo" && country == "Vigo" || team == "Celta" && country == "A Coruña") {
      return SoccerWTFQuestionState(manager as SoccerOnBoardingManager);
    } else {
      return SoccerCongratsState(manager as SoccerOnBoardingManager);
    }
  }
}

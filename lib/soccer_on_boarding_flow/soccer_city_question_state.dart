import 'package:flutter/material.dart';
import 'package:onboarding_proposal/flow_system/flow_state.dart';
import 'package:onboarding_proposal/screens/on_boarding_flow/soccer_city_question_screen.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_congrats_question_state.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_on_boarding_manager.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_team_question_state.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_wtf_question_state.dart';

class SoccerCityQuestionState extends FlowState {
  static const String key = "city";

  SoccerCityQuestionState(SoccerOnBoardingManager manager) : super(flowKey: key, manager: manager);

  @override
  Widget onBuildFlowScreen(BuildContext context) {
    return SoccerCityQuestionScreen(onSelected: manager.next);
  }

  @override
  FlowState? next() {
    final team = manager.state[SoccerTeamQuestionState.key];
    final city = manager.state[key];

    if (team == "Deportivo" && city == "Vigo" || team == "Celta" && city == "A Coruña") {
      return SoccerWTFQuestionState(manager as SoccerOnBoardingManager);
    } else {
      return SoccerCongratsState(manager as SoccerOnBoardingManager);
    }
  }
}

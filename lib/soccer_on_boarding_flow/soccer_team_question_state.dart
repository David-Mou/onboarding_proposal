import 'package:flutter/material.dart';
import 'package:onboarding_proposal/flow_system/flow_state.dart';
import 'package:onboarding_proposal/screens/on_boarding_flow/soccer_team_question_screen.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_city_question_state.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_on_boarding_manager.dart';

class SoccerTeamQuestionState extends FlowState {
  static const String key = "team";

  SoccerTeamQuestionState(SoccerOnBoardingManager manager) : super(flowKey: key, manager: manager);

  @override
  Widget onBuildFlowScreen(BuildContext context) {
    return SoccerTeamQuestionScreen(onSelected: (team) => manager.next(team));
  }

  @override
  FlowState? next() {
    return SoccerCityQuestionState(manager as SoccerOnBoardingManager);
  }
}

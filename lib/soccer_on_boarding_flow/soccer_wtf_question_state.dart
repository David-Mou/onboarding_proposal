import 'package:flutter/material.dart';
import 'package:onboarding_proposal/flow_system/flow_state.dart';
import 'package:onboarding_proposal/screens/on_boarding_flow/soccer_wtf_question_screen.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_city_question_state.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_on_boarding_manager.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_team_question_state.dart';

class SoccerWTFQuestionState extends FlowState {
  static const String key = "wtf";

  SoccerWTFQuestionState(SoccerOnBoardingManager manager) : super(flowKey: key, manager: manager);

  @override
  Widget build(BuildContext context) {
    final team = manager.state[SoccerTeamQuestionState.key];
    final city = manager.state[SoccerCityQuestionState.key];

    return SoccerWTFQuestionScreen(onBack: manager.back, team: team, city: city);
  }
}

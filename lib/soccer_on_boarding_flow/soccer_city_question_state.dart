import 'package:flutter/material.dart';
import 'package:onboarding_proposal/flow_system/flow_state.dart';
import 'package:onboarding_proposal/screens/on_boarding_flow/soccer_city_question_screen.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_team_question_state.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_user_on_boarding_manager.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_wtf_question_state.dart';

class SoccerCityQuestionState extends FlowState {
  static const String key = "city";

  SoccerCityQuestionState(SoccerUserOnBoardingManager manager) : super(flowKey: key, manager: manager);

  @override
  Widget build(BuildContext context) {
    return SoccerCityQuestionScreen(onSelected: onSelected);
  }

  void onSelected(String city) {
    final team = manager.state[SoccerTeamQuestionState.key];

    if (team == "Deportivo" && city == "Vigo" || team == "Celta" && city == "A Coruña") {
      manager.next(city);
    } else {
      manager.finish(city);
    }
  }

  @override
  Future<FlowState?> resolveNextState() async {
    return SoccerWTFQuestionState(manager as SoccerUserOnBoardingManager);
  }
}

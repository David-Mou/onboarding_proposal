import 'package:flutter/material.dart';
import 'package:onboarding_proposal/flow_system/flow_state.dart';
import 'package:onboarding_proposal/screens/on_boarding_flow/soccer_congrats_question_screen.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_city_question_state.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_team_question_state.dart';

import 'soccer_on_boarding_manager.dart';

class SoccerCongratsState extends FlowState {
  static const String key = "congrats";

  SoccerCongratsState(SoccerOnBoardingManager manager) : super(flowKey: key, manager: manager);

  @override
  Widget build(BuildContext context) {
    final team = manager.state[SoccerTeamQuestionState.key];
    final city = manager.state[SoccerCityQuestionState.key];

    return SoccerCongratsQuestionScreen(onFinish: manager.finish, team: team, city: city);
  }

}

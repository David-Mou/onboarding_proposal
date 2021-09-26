import 'package:flutter/material.dart';
import 'package:onboarding_proposal/flow_system/flow_state.dart';
import 'package:onboarding_proposal/screens/on_boarding_flow/soccer_users_question_screen.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_on_boarding_manager.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_team_city_question_state.dart';

class SoccerUsersQuestionState extends FlowState {
  static const String key = "usersCount";

  SoccerUsersQuestionState(SoccerOnBoardingManager manager) : super(flowKey: key, manager: manager);

  @override
  Widget build(BuildContext context) {
    return SoccerUsersQuestionScreen(onSelected: (users) => manager.next(users));
  }

  @override
  Future<FlowState?> resolveNextState() async {
    return SoccerTeamCityQuestionState(manager as SoccerOnBoardingManager, user: 0);
  }
}

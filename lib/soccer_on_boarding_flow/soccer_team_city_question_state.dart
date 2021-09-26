import 'package:flutter/material.dart';
import 'package:onboarding_proposal/flow_system/flow_state.dart';
import 'package:onboarding_proposal/screens/on_boarding_flow/soccer_team_city_question_screen.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_congrats_question_state.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_on_boarding_manager.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_user_on_boarding_manager.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_users_question_state.dart';

class SoccerTeamCityQuestionState extends FlowState {
  static const String key = "users";

  final int user;

  SoccerTeamCityQuestionState(SoccerOnBoardingManager manager, {required this.user})
      : super(flowKey: key, manager: manager);

  @override
  Widget build(BuildContext context) {
    final iteration = UserIteration(user: user, onSelected: onUserDefined);
    return SoccerTeamCityQuestionScreen(userIteration: iteration);
  }

  void onUserDefined(Map<String, dynamic> userDefined) {
    final users = manager.state[key] as List<Map<String, dynamic>>? ?? [];
    users.add(userDefined);
    manager.next(users);
  }

  @override
  Future<FlowState?> resolveNextState() async {
    final usersTotal = manager.state[SoccerUsersQuestionState.key];
    final usersCurrentCount = (manager.state[key] as List).length;

    if(usersTotal == usersCurrentCount) {
      return SoccerCongratsState(manager as SoccerOnBoardingManager);
    } else {
      return SoccerTeamCityQuestionState(manager as SoccerOnBoardingManager, user: usersCurrentCount);
    }
  }
}

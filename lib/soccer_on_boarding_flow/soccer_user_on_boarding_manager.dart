import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_proposal/flow_system/flow_manager.dart';
import 'package:onboarding_proposal/flow_system/flow_notifier.dart';
import 'package:onboarding_proposal/flow_system/flow_state_event.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_team_question_state.dart';

class SoccerUserOnBoardingManager extends FlowManager {
  UserIteration userIteration;

  SoccerUserOnBoardingManager({required this.userIteration});

  @override
  Future<void> onFinish() async {
    print(state);
    userIteration.onSelected(state);
  }
}

class UserIteration {
  final int user;
  final void Function(Map<String, dynamic>) onSelected;

  UserIteration({required this.user, required this.onSelected});

  @override
  bool operator ==(Object other) => other is UserIteration && user == other.user;

  @override
  int get hashCode => user;
}

final userSoccerOnBoardingProvider =
    StateNotifierProvider.autoDispose.family<FlowManagerNotifier, FlowStateEvent, UserIteration>((ref, iteration) {
  final manager = SoccerUserOnBoardingManager(userIteration: iteration);
  ref.onDispose(() => manager.dispose());

  manager.init(SoccerTeamQuestionState(manager));
  return FlowManagerNotifier(manager);
});

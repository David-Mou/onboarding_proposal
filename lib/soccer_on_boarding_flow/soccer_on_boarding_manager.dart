import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_proposal/flow_system/flow_manager.dart';
import 'package:onboarding_proposal/flow_system/flow_notifier.dart';
import 'package:onboarding_proposal/flow_system/flow_state_event.dart';
import 'package:onboarding_proposal/soccer_on_boarding_flow/soccer_team_question_state.dart';

class SoccerOnBoardingManager extends FlowManager {
  SoccerOnBoardingManager();

  @override
  Future<void> onFinish() async {
    print(state);
  }
}

final soccerOnBoardingProvider = StateNotifierProvider.autoDispose<FlowManagerNotifier, FlowStateEvent>((ref) {
  final manager = SoccerOnBoardingManager();
  ref.onDispose(() => manager.dispose());

  manager.init(SoccerTeamQuestionState(manager));
  return FlowManagerNotifier(manager);
});

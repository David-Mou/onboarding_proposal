import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _usersCountProvider = StateProvider.autoDispose((ref) => 1);

class SoccerUsersQuestionScreen extends ConsumerWidget {
  final void Function(int) onSelected;

  const SoccerUsersQuestionScreen({Key? key, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final count = watch(_usersCountProvider);

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("How many users?"),
            Slider(
              value: count.state.toDouble(),
              min: 1,
              max: 5,
              divisions: 4,
              label: count.state.toString(),
              onChanged: (value) => count.state = value.toInt(),
            ),
            TextButton(child: const Text("Next"), onPressed: () => onSelected(count.state)),
          ],
        ),
      ),
    );
  }
}

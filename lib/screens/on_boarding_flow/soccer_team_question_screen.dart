import 'package:flutter/material.dart';

class SoccerTeamQuestionScreen extends StatelessWidget {
  final void Function(String) onSelected;

  const SoccerTeamQuestionScreen({Key? key, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("What is your favorite team?"),
            TextButton(child: const Text("Deportivo"), onPressed: () => onSelected("Deportivo")),
            TextButton(child: const Text("Celta"), onPressed: () => onSelected("Celta")),
          ],
        ),
      ),
    );
  }
}

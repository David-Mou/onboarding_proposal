import 'package:flutter/material.dart';

class SoccerCongratsQuestionScreen extends StatelessWidget {
  final String team;
  final String city;
  final void Function() onFinish;

  const SoccerCongratsQuestionScreen({
    Key? key,
    required this.onFinish,
    required this.team,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Uah! Coming from $city, makes totally sense you support $team"),
            TextButton(child: const Text("Finish"), onPressed: onFinish),
          ],
        ),
      ),
    );
  }
}

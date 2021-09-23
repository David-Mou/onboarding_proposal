import 'package:flutter/material.dart';

class SoccerWTFQuestionScreen extends StatelessWidget {
  final String team;
  final String city;
  final void Function() onBack;

  const SoccerWTFQuestionScreen({
    Key? key,
    required this.onBack,
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
            Text("Seriously you are from $city and you support $team???"),
            TextButton(child: const Text("Correct this. You make me cry"), onPressed: onBack),
          ],
        ),
      ),
    );
  }
}

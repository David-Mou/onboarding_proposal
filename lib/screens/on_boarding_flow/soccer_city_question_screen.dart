import 'package:flutter/material.dart';

class SoccerCityQuestionScreen extends StatelessWidget {
  final void Function(String) onSelected;

  const SoccerCityQuestionScreen({Key? key, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Where are you from?"),
            TextButton(child: const Text("A Coruña"), onPressed: () => onSelected("A Coruña")),
            TextButton(child: const Text("Vigo"), onPressed: () => onSelected("Vigo")),
          ],
        ),
      ),
    );
  }
}

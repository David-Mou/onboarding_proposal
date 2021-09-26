import 'package:flutter/material.dart';

class SoccerCongratsQuestionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users;
  final void Function() onFinish;
  final void Function() onReset;

  const SoccerCongratsQuestionScreen({Key? key, required this.onFinish, required this.onReset, required this.users})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ..._mapUsers(),
            TextButton(child: const Text("Finish"), onPressed: onFinish),
            TextButton(child: const Text("Reset"), onPressed: onReset),
          ],
        ),
      ),
    );
  }

  List<Widget> _mapUsers() {
    return users.asMap().entries.map(
      (user) {
        final data = user.value;
        final id = user.key;

        return Text("Uah user $id! Coming from ${data["city"]}, makes totally sense you support ${data["team"]}");
      },
    ).toList();
  }
}

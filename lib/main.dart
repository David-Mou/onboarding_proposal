import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'on_boarding.dart';

void main() {
  runApp(const OnBoardingApp());
}

class OnBoardingApp extends StatelessWidget {
  const OnBoardingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const OnBoarding(),
      ),
    );
  }
}

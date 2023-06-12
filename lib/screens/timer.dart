import 'package:flutter/material.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
        home: Scaffold(
      body: Center(
        child: Text("Timer"),
      ),
    ));
  }
}

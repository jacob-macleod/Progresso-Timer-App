import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:progresso/screens/time_selector.dart';

class ScreenManager extends StatefulWidget {
  const ScreenManager({super.key});

  @override
  State<ScreenManager> createState() {
    return _ScreenManagerState();
  }
}

class _ScreenManagerState extends State<ScreenManager> {
  String currentScreen = "timeSelector";
  Widget currentScreenWidget = const TimeSelector();

  @override
  Widget build(context) {
    return const MaterialApp(
        home: Scaffold(
      body: Center(
        child: TimeSelector(),
      ),
    ));
  }
}

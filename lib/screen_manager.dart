import 'package:flutter/material.dart';
import 'package:progresso/screens/time_selector.dart';
import 'package:progresso/screens/timer.dart';

class ScreenManager extends StatefulWidget {
  const ScreenManager({super.key});

  @override
  State<ScreenManager> createState() {
    return _ScreenManagerState();
  }
}

class _ScreenManagerState extends State<ScreenManager> {
  Widget? currentScreenWidget;

  // Switch the screen displayed
  void switchScreen(String screen) {
    setState(() {
      if (screen == "timeSelector") {
        currentScreen = "timeSelector";
        currentScreenWidget = TimeSelector(switchScreen);
      } else if (screen == "timer") {
        currentScreen = "timer";
        currentScreenWidget = Timer(switchScreen);
      }
    });
  }

  String currentScreen = "timeSelector";

  @override
  // When the widget is built, set the value of the currentScreenWidget variable
  void initState() {
    super.initState();
    currentScreenWidget = TimeSelector(switchScreen);
  }

  // Return the currentScreenWidget to display
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: currentScreenWidget,
      ),
    ));
  }
}

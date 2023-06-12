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

  void switchScreen(String screen) {
    print("Switching to $screen");
    setState(() {
      if (screen == "timeSelector") {
        currentScreen = "timeSelector";
        currentScreenWidget = TimeSelector(switchScreen);
      } else if (screen == "timer") {
        currentScreen = "timer";
        currentScreenWidget = const Timer();
        print("switched");
      }
    });
  }

  String currentScreen = "timeSelector";
  // Run the code when the class runs initially

  //Widget currentScreenWidget = TimeSelector(switchScreen);

  @override
  void initState() {
    super.initState();
    currentScreenWidget = TimeSelector(switchScreen);
  }

  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: currentScreenWidget,
      ),
    ));
  }
}

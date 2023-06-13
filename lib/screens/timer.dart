import 'package:flutter/material.dart';
import 'package:progresso/componments/background.dart';
import 'package:progresso/componments/normal_button.dart';
import 'package:progresso/componments/ghost_button.dart';

class Timer extends StatefulWidget {
  const Timer(this.switchScreen, {super.key});
  final Function switchScreen;

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;
  bool paused = false;

  void pauseTimer(double value) {
    setState(() {
      if (paused == false) {
        controller.stop();
        paused = true;
      } else {
        controller
          ..forward(from: value)
          ..repeat();
        paused = false;
      }
    });
  }

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /*
  Notes:
    * I need to add comments
    * Progress indicator has a duration of seconds
    * Progress indicator has a bool value between 0 and 1, corrosponding to the percentage finished it is
  */

  @override
  Widget build(BuildContext context) {
    return Background(
      Center(
        child: Column(children: [
          const SizedBox(height: 150),
          Transform.scale(
            scale: 6.0,
            child: CircularProgressIndicator(
              color: const Color.fromRGBO(85, 95, 116, 1), // Try a gradient
              value: controller.value,
              semanticsLabel: 'Circular progress indicator',
            ),
          ),
          const SizedBox(height: 150),
          GhostButton("Pause", pauseTimer, controller.value),
          NormalButton("Finish", widget.switchScreen, "timeSelector"),
        ]),
      ),
    );
  }
}

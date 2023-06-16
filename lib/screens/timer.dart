import 'package:flutter/material.dart';
import 'package:progresso/componments/background.dart';
import 'package:progresso/componments/normal_button.dart';
import 'package:progresso/componments/ghost_button.dart';

class Timer extends StatefulWidget {
  const Timer(this.switchScreen, this.time, {super.key});
  final Function(String, List<int>?) switchScreen;
  final List<int>? time;

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  /*
    NOTE: A lot of the timer code is from the flutter docs, I'm not sure what it does exactly!
   */
  // Set some variables
  late AnimationController controller;
  bool determinate = false;
  bool paused = false;
  int timeInSeconds = 0;

  // When the pause button is pressed
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
    // Conver the time to seconds
    int timeInSeconds =
        widget.time![0] * 3600 + widget.time![1] * 60 + widget.time![2];

    // Create a controller
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: Duration(seconds: timeInSeconds),
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
  Notes for myself:
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
              backgroundColor: Color.fromARGB(255, 171, 176, 188),
              value: controller.value,
              semanticsLabel: 'Circular progress indicator',
            ),
          ),
          const SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NormalButton("Finish", widget.switchScreen, "timeSelector"),
              const SizedBox(width: 25),
              GhostButton("Pause", pauseTimer, controller.value),
            ],
          ),
        ]),
      ),
    );
  }
}

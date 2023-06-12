import 'package:flutter/material.dart';
import 'package:progresso/componments/background.dart';
import 'package:progresso/componments/normal_button.dart';

class Timer extends StatefulWidget {
  const Timer(this.switchScreen, {super.key});
  final Function switchScreen;

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

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
          CircularProgressIndicator(
            value: controller.value,
            semanticsLabel: 'Circular progress indicator',
          ),
          Switch(
            value: determinate,
            onChanged: (bool value) {
              setState(() {
                determinate = value;
                if (determinate) {
                  controller.stop();
                } else {
                  controller
                    ..forward(from: 0.5)
                    ..repeat();
                }
              });
            },
          ),
          NormalButton("Finish", widget.switchScreen, "timeSelector"),
        ]),
      ),
    );
  }
}

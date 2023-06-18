import 'package:flutter/material.dart';
import 'package:progresso/componments/background.dart';
import 'package:progresso/componments/normal_button.dart';
import 'package:progresso/componments/ghost_button.dart';
import 'package:audioplayers/audioplayers.dart';

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

  bool soundPlaying = false;
  final player = AudioPlayer();

  void playSound() async {
    if (soundPlaying == false) {
      player.play(AssetSource("timerFinished.wav"));
      soundPlaying = true;
    }
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
        setState(() {
          // Update the seconds countdown
          hour =
              ((timeInSeconds - (controller.value * timeInSeconds).toInt()) ~/
                      3600)
                  .toString();
          minute =
              (((timeInSeconds - (controller.value * timeInSeconds).toInt()) %
                          3600) ~/
                      60)
                  .toString();
          second =
              ((timeInSeconds - (controller.value * timeInSeconds).toInt()) %
                      60)
                  .toString();
        });

        if (controller.value > 0.99) {
          //soundPlaying = false;
          playSound();
          print("playing");
        }
      });

    controller.repeat(reverse: false);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final TextStyle _selectedTimePickerStyle = const TextStyle(
    color: Color.fromRGBO(237, 231, 222, 1),
    fontWeight: FontWeight.w300,
    fontSize: 50,
  );

  final double _height = 40;
  final double _width = 90;

  String hour = "1";
  String minute = "30";
  String second = "54";
  /*
  Notes for myself:
    * Progress indicator has a duration of seconds
    * Progress indicator has a bool value between 0 and 1, corrosponding to the percentage finished it is
  */

  @override
  Widget build(BuildContext context) {
    return Background(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(children: [
              const SizedBox(height: 150),
              Stack(
                alignment: Alignment.center,
                children: [
                  Transform.scale(
                    scale: 7.0,
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(30, 31, 41, 1),
                      backgroundColor: const Color.fromRGBO(85, 95, 116, 1),
                      value: controller.value,
                      semanticsLabel: 'Circular progress indicator',
                      strokeWidth: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(hour, style: _selectedTimePickerStyle),
                      Text(":", style: _selectedTimePickerStyle),
                      Text(minute, style: _selectedTimePickerStyle),
                      Text(":", style: _selectedTimePickerStyle),
                      Text(second, style: _selectedTimePickerStyle),
                    ],
                  ),
                ],
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
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

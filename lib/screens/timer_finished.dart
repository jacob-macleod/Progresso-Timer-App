import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:progresso/componments/background.dart';
import 'package:progresso/componments/normal_button.dart';
import 'package:audioplayers/audioplayers.dart';

class TimerFinished extends StatefulWidget {
  TimerFinished(this.switchScreen, {super.key});
  final Function(String, List<int>?) switchScreen;

  @override
  _TimerFinishedState createState() => _TimerFinishedState();
}

class _TimerFinishedState extends State<TimerFinished> {
  //TimerFinished(this.switchScreen, {super.key});
  //final Function(String, List<int>?) switchScreen;

  final TextStyle _selectedTimePickerStyle = const TextStyle(
    color: Color.fromRGBO(237, 231, 222, 1),
    fontWeight: FontWeight.w300,
    fontSize: 50,
  );

  final player = AudioPlayer();
  int soundCount = 0;
  int maxSoundCount = 3;

  void playSound() async {
    player.play(AssetSource("timeFinishedShort.wav"));
  }

  void loadMainScreen(String screen, List<int>? time) {
    player.stop();
    widget.switchScreen(screen, time);
  }

  @override
  Widget build(context) {
    playSound();
    return Background(Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(height: 150),
        Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: 7.0,
              child: const CircularProgressIndicator(
                color: Color.fromRGBO(30, 31, 41, 1),
                backgroundColor: Color.fromRGBO(85, 95, 116, 1),
                value: 1,
                semanticsLabel: 'Circular progress indicator',
                strokeWidth: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("00", style: _selectedTimePickerStyle),
                Text(":", style: _selectedTimePickerStyle),
                Text("00", style: _selectedTimePickerStyle),
                Text(":", style: _selectedTimePickerStyle),
                Text("00", style: _selectedTimePickerStyle),
              ],
            ),
          ],
        ),
        const SizedBox(height: 150),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NormalButton("End", loadMainScreen, "timeSelector"),
          ],
        ),
      ]),
    ));
  }
}

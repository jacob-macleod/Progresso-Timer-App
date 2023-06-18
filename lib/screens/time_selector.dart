import 'package:flutter/material.dart';
import 'package:progresso/componments/background.dart';
import 'package:progresso/componments/number_picker.dart';
import 'package:audioplayers/audioplayers.dart';

class TimeSelector extends StatelessWidget {
  const TimeSelector(this.switchScreen, {super.key});
  final Function(String screen, List<int>?) switchScreen;

  @override
  Widget build(context) {
    return Background(
      Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // NumberPickerWidget also displays a button - I couln't work out how to display it here but still read the value of number picker widget!
          // TODO: Fix this somehow!
          NumberPickerWidget(switchScreen),
        ]),
      ),
    );
  }
}

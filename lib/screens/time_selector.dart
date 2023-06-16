import 'package:flutter/material.dart';
import 'package:progresso/componments/background.dart';
import 'package:progresso/componments/number_picker.dart';
import 'package:progresso/componments/normal_button.dart';

class TimeSelector extends StatelessWidget {
  const TimeSelector(this.switchScreen, {super.key});
  final Function(String screen) switchScreen;

  @override
  Widget build(context) {
    NumberPickerWidget myObject = NumberPickerWidget(switchScreen);
    print(myObject.getTimeSelectorValues());
    return Background(
      Center(
        child: Column(
          children: [
            NumberPickerWidget(switchScreen),
            // Parameters are text, onclick function, string to pass to the switchScreen function
            NormalButton("Start Timer", switchScreen, "timer"),
          ],
        ),
      ),
    );
  }
}

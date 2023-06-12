import 'package:flutter/material.dart';
import 'package:progresso/componments/background.dart';
import 'package:progresso/componments/number_picker.dart';
import 'package:progresso/componments/normal_button.dart';

class TimeSelector extends StatelessWidget {
  const TimeSelector(this.switchScreen, {super.key});
  final Function(String screen) switchScreen;

  void onClick(String text) {
    // Print the input to the console
    print(text);
  }

  @override
  Widget build(context) {
    return Background(
      Center(
        child: Column(
          children: [
            const NumberPickerWidget(),
            NormalButton("Start Timer", switchScreen),
          ],
        ),
      ),
    );
  }
}

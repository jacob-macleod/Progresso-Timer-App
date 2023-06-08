import 'package:flutter/material.dart';
import 'package:progresso/componments/background.dart';
import 'package:progresso/componments/number_picker.dart';
import 'package:progresso/componments/normal_button.dart';

class TimeSelector extends StatelessWidget {
  const TimeSelector({super.key});

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
            NormalButton("Hello", onClick),
          ],
        ),
      ),
    );
  }
}

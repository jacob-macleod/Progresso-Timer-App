import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:progresso/componments/normal_button.dart';

class NumberPickerWidget extends StatefulWidget {
  const NumberPickerWidget(this.switchScreen, {Key? key}) : super(key: key);
  final Function(String screen, List<int>?) switchScreen;

  @override
  State<NumberPickerWidget> createState() {
    return _NumberPickerWidgetState();
  }
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  // Have to be late, or onChanged: (value) => setState(() => minute = value) will throw an error
  late int hour = 7;
  late int minute = 30;
  late int second = 15;

  @override
  void initState() {
    super.initState();
    hour = 0;
    minute = 0;
    second = 00;
  }

  // Define a few text styles
  final TextStyle _timePickerStyle = const TextStyle(
    color: Color.fromRGBO(99, 99, 99, 1),
    fontSize: 40,
  );

  final TextStyle _selectedTimePickerStyle = const TextStyle(
    color: Color.fromRGBO(237, 231, 222, 1),
    fontWeight: FontWeight.w800,
    fontSize: 64,
  );

  final double _height = 70;
  final double _width = 90;

  // Actuall display the page content
  @override
  Widget build(BuildContext context) {
    // Display a collumn
    return Column(
      children: <Widget>[
        // Display a sized box
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            NumberPicker(
              value: hour,
              minValue: 0,
              maxValue: 23,
              haptics: true,
              textStyle: _timePickerStyle,
              selectedTextStyle: _selectedTimePickerStyle,
              itemHeight: _height,
              itemWidth: _width,
              onChanged: (value) => setState(() => hour = value),
              infiniteLoop: true,
            ),
            NumberPicker(
              value: minute,
              minValue: 0,
              maxValue: 59,
              haptics: true,
              textStyle: _timePickerStyle,
              selectedTextStyle: _selectedTimePickerStyle,
              itemHeight: _height,
              itemWidth: _width,
              onChanged: (value) => setState(() => minute = value),
              infiniteLoop: true,
            ),
            NumberPicker(
              value: second,
              minValue: 0,
              maxValue: 59,
              haptics: true,
              textStyle: _timePickerStyle,
              selectedTextStyle: _selectedTimePickerStyle,
              itemHeight: _height,
              itemWidth: _width,
              onChanged: (value) => setState(() => second = value),
              infiniteLoop: true,
            ),
          ],
        ),
        const SizedBox(height: 30),
        // Display a button
        NormalButton("Start Timer", widget.switchScreen, "timer",
            time: [hour, minute, second]),
      ],
    );
  }
}

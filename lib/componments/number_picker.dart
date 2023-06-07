/*
NumberPicker(
          value: 6,
          minValue: 0,
          maxValue: 100,
          step: 10,
          haptics: true,
          onChanged: ,
        ),*/

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerWidget extends StatefulWidget {
  const NumberPickerWidget({super.key});

  @override
  State<NumberPickerWidget> createState() {
    return _NumberPickerWidgetState();
  }
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  int _currentValue1 = 3;
  int _currentValue2 = 3;
  int _currentValue3 = 3;
  final TextStyle _timePickerStyle = const TextStyle(color: Colors.white);

  @override
  Widget build(context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 150),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            NumberPicker(
              value: _currentValue1,
              minValue: 0,
              maxValue: 100,
              haptics: true,
              textStyle: _timePickerStyle,
              onChanged: (value) => setState(() => _currentValue1 = value),
            ),
            NumberPicker(
              value: _currentValue2,
              minValue: 0,
              maxValue: 100,
              haptics: true,
              textStyle: _timePickerStyle,
              onChanged: (value) => setState(() => _currentValue2 = value),
            ),
            NumberPicker(
              value: _currentValue3,
              minValue: 0,
              maxValue: 100,
              haptics: true,
              textStyle: _timePickerStyle,
              onChanged: (value) => setState(() => _currentValue3 = value),
            ),
          ],
        ),
        Text('Current value: $_currentValue1'),
        Text('Current value: $_currentValue2'),
        Text('Current value: $_currentValue3'),
      ],
    );
  }
}

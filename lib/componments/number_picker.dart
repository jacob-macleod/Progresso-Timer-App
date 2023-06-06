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
  int _currentValue = 3;

  @override
  Widget build(context) {
    return Column(
      children: <Widget>[
        NumberPicker(
          value: _currentValue,
          minValue: 0,
          maxValue: 100,
          onChanged: (value) => setState(() => _currentValue = value),
        ),
        Text('Current value: $_currentValue'),
      ],
    );
  }
}

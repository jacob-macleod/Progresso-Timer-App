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
  NumberPickerWidget(this.switchScreen, {super.key});
  final Function switchScreen;

  int _hour = 7;
  int _minute = 30;
  int _second = 15;

  List<int> getTimeSelectorValues() {
    return [_hour, _minute, _second];
  }

  @override
  State<NumberPickerWidget> createState() {
    return _NumberPickerWidgetState();
  }
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  final TextStyle _timePickerStyle = const TextStyle(
    color: Color.fromRGBO(99, 99, 99, 1),
    fontSize: 40,
  );
  final TextStyle _selectedTimePickerStyle = const TextStyle(
    color: Color.fromRGBO(237, 231, 222, 1),
    fontWeight: FontWeight.w800,
    fontSize: 64,
  );
  final double _height = 60;
  final double _width = 90;

  @override
  Widget build(context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 150),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            NumberPicker(
              value: widget._hour,
              minValue: 0,
              maxValue: 23,
              haptics: true,
              textStyle: _timePickerStyle,
              selectedTextStyle: _selectedTimePickerStyle,
              itemHeight: _height,
              itemWidth: _width,
              onChanged: (value) => setState(() => widget._hour = value),
            ),
            NumberPicker(
              value: widget._minute,
              minValue: 0,
              maxValue: 59,
              haptics: true,
              textStyle: _timePickerStyle,
              selectedTextStyle: _selectedTimePickerStyle,
              itemHeight: _height,
              itemWidth: _width,
              onChanged: (value) => setState(() => widget._minute = value),
            ),
            NumberPicker(
              value: widget._second,
              minValue: 0,
              maxValue: 59,
              haptics: true,
              textStyle: _timePickerStyle,
              selectedTextStyle: _selectedTimePickerStyle,
              itemHeight: _height,
              itemWidth: _width,
              onChanged: (value) => setState(() => widget._second = value),
            ),
          ],
        ),
        Text('Current value: $widget._hour'),
        Text('Current value: $widget._minute'),
        Text('Current value: $widget._second'),
      ],
    );
  }
}

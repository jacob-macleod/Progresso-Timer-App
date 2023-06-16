import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:progresso/componments/normal_button.dart';

class NumberPickerWidget extends StatefulWidget {
  NumberPickerWidget(this.switchScreen, {Key? key}) : super(key: key);
  final Function(String screen, List<int>?) switchScreen;

  @override
  State<NumberPickerWidget> createState() {
    return _NumberPickerWidgetState();
  }

  List<int> getTimeSelectorValues() {
    return _NumberPickerWidgetState().getTimeSelectorValues();
  }
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  late int hour = 7;
  late int minute = 30;
  late int second = 15;

  @override
  void initState() {
    super.initState();
    hour = 7;
    minute = 30;
    second = 15;
  }

  List<int> getTimeSelectorValues() {
    return [hour, minute, second];
  }

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
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 150),
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
            ),
          ],
        ),
        Text('Current value: $hour'),
        Text('Current value: $minute'),
        Text('Current value: $second'),
        NormalButton("Start Timer", widget.switchScreen, "timer",
            time: [hour, minute, second]),
      ],
    );
  }
}

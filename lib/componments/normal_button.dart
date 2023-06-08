import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  const NormalButton(this.text, this.onPressed, {super.key});
  final String text;
  final Function onPressed;

  @override
  Widget build(context) {
    return OutlinedButton(
      onPressed: () => onPressed("hi"),
      child: Text(
        text,
        style: const TextStyle(
          color: Color.fromRGBO(237, 231, 222, 1),
          fontSize: 24,
        ),
      ),
    );
  }
}

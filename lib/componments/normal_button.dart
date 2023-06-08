import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  const NormalButton(this.text, this.onPressed, {super.key});
  final String text;
  final Function onPressed;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: () => onPressed("hi"),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: const Color.fromRGBO(85, 95, 116, 1),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
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
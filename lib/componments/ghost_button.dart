import 'package:flutter/material.dart';

class GhostButton extends StatelessWidget {
  const GhostButton(this.text, this.onPressed, this.value, {super.key});
  final String text;
  final Function onPressed;
  final double value;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(85, 95, 116, 1),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        onPressed: () => onPressed(value),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          backgroundColor: const Color.fromRGBO(38, 37, 51, 1),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color.fromRGBO(237, 231, 222, 1),
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

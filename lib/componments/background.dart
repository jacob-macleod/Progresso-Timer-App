import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background(this.childWidget, {super.key});
  final Widget childWidget;

  @override
  Widget build(context) {
    return Container(
      // Make a gradient that goes from top to bottom
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromRGBO(46, 45, 51, 1),
            Color.fromRGBO(38, 37, 51, 1)
          ])),
      child: Center(
        child: childWidget,
      ),
    );
  }
}

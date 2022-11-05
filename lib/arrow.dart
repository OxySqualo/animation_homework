import 'dart:math';
import 'package:flutter/material.dart';

class MyArrow extends StatefulWidget {
  const MyArrow({super.key});

  @override
  State<MyArrow> createState() => _MyArrowState();
}

class _MyArrowState extends State<MyArrow> {
  final initial = Tween(begin: 0.0, end: 0.0);
  final forward = Tween(begin: 0.0, end: pi);
  final reverse = Tween(begin: pi, end: 0.0);
  late var tween = initial;
  bool _isInitialValue = true;

  void toggle() {
    setState(() {
      if (tween == initial || tween == reverse) {
        tween = forward;
      } else if (tween == forward) {
        tween = reverse;
      }
      _isInitialValue = !_isInitialValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: TweenAnimationBuilder(
          curve: Curves.ease,
          tween: tween,
          duration: const Duration(seconds: 1),
          builder: (BuildContext context, double value, Widget? child) {
            return Transform.rotate(
              angle: value,
              child: child ?? const SizedBox.shrink(),
            );
          },
          child: const Icon(
            Icons.arrow_circle_down_sharp,
            size: 50.0,
            color: Colors.white,
          )),
    );
  }
}

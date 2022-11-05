import 'package:flutter/material.dart';
import 'dart:math' as math;

class RotateAuto extends StatefulWidget {
  const RotateAuto({super.key});

  @override
  State<RotateAuto> createState() => _RotateAutoState();
}

TextStyle style = const TextStyle(
    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
@override
void initState() {}

class _RotateAutoState extends State<RotateAuto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(180, 164, 238, 234),
          title: const Text('Авто-анимация',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/ocean.jpeg'),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Подожди...", style: style),
              TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 2 * math.pi),
                  onEnd: () {
                    Navigator.pushNamed(
                      context,
                      '/page3',
                    );
                  },
                  duration: const Duration(seconds: 5),
                  builder: (__, double angle, _) {
                    return Transform.rotate(
                      transformHitTests: true,
                      angle: angle,
                      child: Image.asset('assets/images/t2.png'),
                    );
                  }),
            ],
          ),
        ));
  }
}

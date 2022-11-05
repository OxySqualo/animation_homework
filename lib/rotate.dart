import 'package:flutter/material.dart';

class RotateWidget extends StatefulWidget {
  const RotateWidget({super.key});

  @override
  State<RotateWidget> createState() => _RotateWidgetState();
}

TextStyle style = const TextStyle(
    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

class _RotateWidgetState extends State<RotateWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(180, 164, 238, 234),
          title: const Text('Поворот',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ocean.jpeg"),
                fit: BoxFit.cover),
          ),
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: Tween(begin: 5.0, end: 0.0).animate(_controller),
                  child: Image.asset(
                      height: 300, width: 300, "assets/images/t2.png"),
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(180, 164, 238, 234)),
                      shadowColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(255, 218, 162, 181)),
                    ),
                    child: Text(
                      "Покрутить черепашку",
                      style: style,
                    ),
                    onPressed: () {
                      _controller.reset();
                      _controller.forward();
                    }),
                // SizedBox(height: 70),
                ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(180, 164, 238, 234)),
                      shadowColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(255, 218, 162, 181)),
                    ),
                    child: Text("Остановить черепашку", style: style),
                    onPressed: () {
                      _controller.stop();
                    }),
              ]),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:week_13/rotate.dart';
import 'package:week_13/rotate2.dart';
import 'package:week_13/row_list.dart';
import 'package:week_13/custom_page.dart';
import 'package:week_13/hero_page.dart';

void main() {
  runApp(const Nav2App());
}

class Nav2App extends StatelessWidget {
  const Nav2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const RotateWidget(),
        '/page2': (context) => const RotateAuto(),
        '/page3': (context) => const MyCustomAnimation(),
        '/page4': (context) => const HeroAnimation(),
      },
    );
  }
}

TextStyle style = const TextStyle(
    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(180, 164, 238, 234),
          title: const Text('Анимация',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ocean.jpeg"),
                fit: BoxFit.cover),
          ),
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(180, 164, 238, 234)),
                      shadowColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(255, 218, 162, 181)),
                    ),
                    child: Text(
                      'RotationTransition',
                      style: style,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(CustomPageRoute(child: const RotateWidget()));
                    }),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(180, 164, 238, 234)),
                    shadowColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 218, 162, 181)),
                  ),
                  child: Text('TweenAnimationBuilder', style: style),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/page2',
                    );
                  },
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(180, 164, 238, 234)),
                    shadowColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 218, 162, 181)),
                  ),
                  child: Text(
                    'AnimatedBuilder & SizeTransition',
                    style: style,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/page3',
                    );
                  },
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(180, 164, 238, 234)),
                    shadowColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 218, 162, 181)),
                  ),
                  child: Text(
                    'Hero Animation',
                    style: style,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(CustomPageRoute(child: const HeroAnimation()));
                  },
                ),
              ]),
        ));
  }
}

//кнопочка крутится но не окрывает список(
import 'package:flutter/material.dart';
import 'package:week_13/arrow.dart';

class MyCustomAnimation extends StatefulWidget {
  const MyCustomAnimation({super.key});

  @override
  State<MyCustomAnimation> createState() => _MyCustomAnimationState();
}

class _MyCustomAnimationState extends State<MyCustomAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final _animationDuration = const Duration(seconds: 1);
  var _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );
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
          title: const Text(
            'Список',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ocean.jpeg"),
                fit: BoxFit.cover),
          ),
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.05,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MantaApp(),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 60,
                color: const Color.fromARGB(214, 6, 16, 75),
                child: Row(children: [
                  const MyArrow(),
                  IconButton(
                    icon: Icon(
                      _isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      _isExpanded
                          ? _controller.reverse()
                          : _controller.forward();
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  ),
                  const Text(
                    "??? Объединить анимацию \nстрелки и списка???",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
              ),
              CustomListTile(
                text: 'Дельфин',
                controller: _controller,
              ),
              CustomListTile(
                text: 'Скат',
                controller: _controller,
              ),
              CustomListTile(
                text: 'Черепаха',
                controller: _controller,
              ),
            ],
          ),
        ));
  }
}

class CustomListTile extends StatelessWidget {
  CustomListTile({
    required this.controller,
    required this.text,
    super.key,
  }) : scale = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic),
        );
  final AnimationController controller;
  final String text;
  final Animation<double> scale;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return SizeTransition(
            sizeFactor: scale,
            axis: Axis.vertical,
            axisAlignment: -1,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 60,
              color: const Color.fromARGB(180, 164, 238, 234),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.fade,
                // ),
              ),
            ),
            // ),
          );
        });
  }
}

class AnimatedManta extends AnimatedWidget {
  const AnimatedManta({super.key, required Animation<double> animation})
      : super(listenable: animation);

  // Make the Tweens static because they don't change.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 20, end: 200);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
        child: Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        child: Image.asset("assets/images/m4.png"),
      ),
    ));
  }
}

class MantaApp extends StatefulWidget {
  const MantaApp({super.key});

  @override
  State<MantaApp> createState() => _MantaAppState();
}

class _MantaAppState extends State<MantaApp>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.stop();
          // если меняю  stop на reserve , то будет исчезать
          // } else if (status == AnimationStatus.dismissed) {
          //   controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedManta(animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

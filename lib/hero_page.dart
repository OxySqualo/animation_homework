import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(180, 164, 238, 234),
        title: const Text('Hero-Анимация',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/ocean.jpeg"), fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: PhotoHero(
          photo: 'assets/images/dolphins.png',
          width: 60.0,
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color.fromARGB(180, 164, 238, 234),
                  title: const Text('Hero-Анимация',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
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
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      PhotoHero(
                        photo: 'assets/images/dolphins.png',
                        width: 150.0,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const Center(
                        child: Text(
                          "Спасибо за рыбу и пока!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color.fromARGB(214, 6, 16, 75),
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.6,
                        // color: const Color.fromARGB(214, 6, 16, 75),
                        child: const Center(
                          child: Text(
                            """So long and thanks for all the fish
So sad that it should come to this
We tried to warn you all but oh dear
You may not share our intellect
Which might explain your disrespect
For all the natural wonders that
grow around you

So long, so long and thanks
for all the fish

The world's about to be destroyed
There's no point getting all annoyed
Lie back and let the planet dissolve(around you)
Despite those nets of tuna fleets
We thought that most of you were sweet
Especially tiny tots and your
pregnant women

So long, so long, so long, so long, so long
So long, so long, so long, so long, so long

So long, so long and thanks
for all the fish""",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {Key? key, required this.photo, required this.onTap, required this.width})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

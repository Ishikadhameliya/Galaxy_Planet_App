import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planet_app/res/modals.dart';
import 'package:planet_app/views/screens/details_page.dart';
import 'package:planet_app/views/screens/splashscreen_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashscreen_page',
      routes: {
        '/': (context) => const Homepage(),
        'splashscreen_page': (context) => const SplashScreenPage(),
        'detail_page': (context) => const DetailsPage(),
      },
    ),
  );
}

data() async {
  String res = await rootBundle.loadString("assets/json/data.json");
  List decodeData = jsonDecode(res);
  galaxy = decodeData.map((e) => planet.fromMap(data: e)).toList();
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

late AnimationController animationController;
late Animation sizeAnimation;



List<planet> galaxy = [];

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    data();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..forward();

    sizeAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutSine,
      ),
    );

    animationController.addListener(() {
      setState(() {});
    });

    animationController.addStatusListener((status) {
      if(animationController.isCompleted){
        animationController.reverse();
      }else if(animationController.isDismissed){
        animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Galaxy Planets",
          style: TextStyle(color: Colors.yellow.shade300, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff090e21),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/spacebghome.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 30);
          },
          itemCount: galaxy.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context)
                      .pushNamed('detail_page', arguments: galaxy[index]);
                });
              },
              child: Container(
                height: _height * 0.4,
                width: _width / 1.20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.3),
                    Colors.grey.withOpacity(0.5)
                  ]),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.yellow.shade200,
                    width: 8,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${galaxy[index].name}",
                      style: const TextStyle(fontSize: 30, color: Colors.white,),
                    ),
                    const SizedBox(height: 10,),
                    AnimatedBuilder(
                      animation: animationController,
                      builder: (context, _) {
                        return Transform.scale(
                          scale: sizeAnimation.value,
                          child: SizedBox(
                            height: 160,
                            child: Hero(
                              tag: galaxy[index].tag,
                              child: Image.asset("${galaxy[index].image}",
                                     fit: BoxFit.fill, height: 160),
                               ),
                            ),
                        );
                      },
                    ),
                    // RotationTransition(
                    //   alignment: Alignment.center,
                    //   turns: animationController,
                    //   child: Image.asset("${galaxy[index].image}",
                    //       fit: BoxFit.fill, height: 160),
                    // )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


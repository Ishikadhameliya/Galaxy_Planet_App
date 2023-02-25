import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

late AnimationController animationController;
late AnimationController nameanimationController;
late Animation nameAnimation;

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000))
      ..repeat();
    nameanimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000))
      ..forward();

    nameAnimation = Tween<double>(begin: 0, end: 6).animate(CurvedAnimation(
        parent: nameanimationController, curve: Curves.bounceOut));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
          title: Text("${res.name}",
              style: TextStyle(color: Colors.yellow.shade300, fontSize: 30)),
          centerTitle: true,
          backgroundColor: const Color(0xff090e21),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/spacebghome.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _height * 0.3,
                width: _width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0),
                ),
                child: RotationTransition(
                  turns: animationController,
                  alignment: Alignment.center,
                  child: Container(
                    height: 180,
                    width: 180,
                    child: Image.asset("${res.image}"),
                  ),
                ),
              ),
             // const SizedBox(height: 10),
              Container(
                  height: _height * 0.20,
                  width: _width / 1.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.grey.withOpacity(0.5)
                    ]),
                    border: Border.all(
                      color: Colors.amber.shade200,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: AnimatedBuilder(
                    animation: nameAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: nameAnimation.value,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${res.name}",
                                style: TextStyle(
                                  color: Colors.indigo.shade900,
                                  //color: Color(0xff090e21),
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "velocity :${res.velocity}",
                                style: TextStyle(
                                  color: Colors.indigo.shade900,
                                  fontSize: 3.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "distance : ${res.distance}",
                                style: TextStyle(
                                  color: Colors.indigo.shade900,
                                  fontSize: 3.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      );
                    },
                  )),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.4),
                    Colors.grey.withOpacity(0.5)
                  ]),
                  border: Border.all(
                    color: Colors.amber.shade200,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "description :",
                        style:  TextStyle(
                          color: Colors.indigo.shade900,
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "${res.description}",
                        style: TextStyle(
                            color: Colors.indigo.shade900,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation heightAnimation;
  late Animation widthAnimation;
  late Animation borderAnimation;
  late Animation borderColorAnimation;
  late Animation colorAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..forward();

    heightAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 60), weight: 2),
      TweenSequenceItem(tween: Tween<double>(begin: 60, end: 70), weight: 0.5),
      TweenSequenceItem(tween: Tween<double>(begin: 70, end: 80), weight: 0.5),
      TweenSequenceItem(tween: Tween<double>(begin: 80, end: 120), weight: 0.5),
      TweenSequenceItem(
          tween: Tween<double>(begin: 120, end: 120), weight: 0.5),
    ]).animate(animationController);

    widthAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 60), weight: 2),
      TweenSequenceItem(tween: Tween<double>(begin: 60, end: 120), weight: 0.5),
      TweenSequenceItem(
          tween: Tween<double>(begin: 120, end: 180), weight: 0.5),
      TweenSequenceItem(
          tween: Tween<double>(begin: 180, end: 250), weight: 0.5),
      TweenSequenceItem(
          tween: Tween<double>(begin: 250, end: 250), weight: 0.5),
    ]).animate(animationController);

    borderAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(
              begin: BorderRadius.circular(100),
              end: BorderRadius.circular(100)),
          weight: 2),
      TweenSequenceItem(
          tween: Tween(
              begin: BorderRadius.circular(100),
              end: BorderRadius.circular(50)),
          weight: 0.5),
      TweenSequenceItem(
          tween: Tween(
              begin: BorderRadius.circular(50), end: BorderRadius.circular(25)),
          weight: 0.5),
      TweenSequenceItem(
          tween: Tween(
              begin: BorderRadius.circular(25), end: BorderRadius.circular(10)),
          weight: 0.5),
      TweenSequenceItem(
          tween: Tween(
              begin: BorderRadius.circular(10), end: BorderRadius.circular(10)),
          weight: 0.5),
    ]).animate(animationController);

    borderColorAnimation = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.white, end: Colors.white), weight: 2),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.white, end: Colors.redAccent),
          weight: 0.5),
      TweenSequenceItem(
          tween:
          ColorTween(begin: Colors.redAccent, end: Colors.deepOrangeAccent),
          weight: 0.5),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.deepOrangeAccent, end: Colors.white),
          weight: 0.5),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.white, end: Colors.white),
          weight: 0.5),
    ]).animate(animationController);

    colorAnimation = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.transparent, end: Colors.transparent),
          weight: 2),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.transparent, end: Colors.transparent),
          weight: 0.5),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.transparent, end: Colors.transparent),
          weight: 0.5),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.transparent, end: Colors.transparent),
          weight: 0.5),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.transparent, end: Colors.black54),
          weight: 0.5),
    ]).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 40),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/as.jpeg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            TweenAnimationBuilder(
              tween: Tween<Offset>(
                  begin: const Offset(0, -100), end: const Offset(0, 150)),
              duration: const Duration(milliseconds: 2000),
              curve: Curves.bounceOut,
              builder: (context, Offset dimension, _) {
                return Transform.translate(
                  offset: dimension,
                  child: Container(
                    height: heightAnimation.value,
                    width: widthAnimation.value,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: colorAnimation.value,
                        border: Border.all(
                            color: borderColorAnimation.value, width: 2.5),
                        borderRadius: borderAnimation.value),
                    child: (animationController.isCompleted)
                        ? const Text(
                      '𝐖𝐞𝐥𝐜𝐨𝐦𝐞 \n 𝕊𝕡𝕒𝕔𝕖 𝔾𝕒𝕝𝕒x𝕪 🌍🚀',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.75,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )
                        : Container(),
                  ),
                );
              },
            ),
            const SizedBox(height: 360),
            (animationController.isCompleted)
                ? TweenAnimationBuilder(
              tween: Tween<Offset>(
                  begin: const Offset(0, 250), end: const Offset(0, 100)),
              duration: const Duration(milliseconds: 2000),
              builder: (context, Offset align, _) {
                return Transform.translate(
                  offset: align,
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black54,
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        const Text('𝐄𝐱𝐩𝐥𝐨𝐫𝐞', style: TextStyle(fontSize: 20,color: Colors.white),),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/');
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.teal
                            ),
                            child: const Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
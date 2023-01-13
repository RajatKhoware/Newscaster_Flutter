import 'package:flutter/material.dart';
import 'package:market_news/Presentation/common/colors.dart';
import 'package:market_news/Presentation/screens/Intro/widget/custom-intro.dart';

class SecondIntro extends StatefulWidget {
  const SecondIntro({Key? key}) : super(key: key);

  @override
  State<SecondIntro> createState() => _SecondIntroState();
}

class _SecondIntroState extends State<SecondIntro> {
  @override
  Widget build(BuildContext context) {
    return CustomIntro(
        onTapParams: () {
          Navigator.pushNamed(context, "/nav_bar");
        },
        onTapaaOfStartButton: () {
          Navigator.pushNamed(context, "/splash_third");
        },
        onTapOfBackButton: () {
          Navigator.pop(context);
        },
        pageCount: "2/3",
        backgroundColor: mordernBlue,
        mainText: "THE LATEST MARKET \nINSIGHTS AND \nANALYSIS",
        img: "assets/intro-img/Intro-2.png",
        indicatorPercentage: 0.66,
        startButtonState: false,
        backButtonState: true);
  }
}

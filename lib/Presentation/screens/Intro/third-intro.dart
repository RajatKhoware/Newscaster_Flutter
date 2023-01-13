import 'package:flutter/material.dart';
import 'package:market_news/Presentation/common/colors.dart';
import 'package:market_news/Presentation/screens/Intro/widget/custom-intro.dart';

class ThirdIntro extends StatefulWidget {
  const ThirdIntro({Key? key}) : super(key: key);

  @override
  State<ThirdIntro> createState() => _ThirdIntroState();
}

class _ThirdIntroState extends State<ThirdIntro> {
  @override
  Widget build(BuildContext context) {
    return CustomIntro(
        onTapParams: () {
          Navigator.pushNamed(context, "/nav_bar");
        },
        onTapaaOfStartButton: () {
          Navigator.pushNamed(context, "/nav_bar");
        },
        onTapOfBackButton: () {
          Navigator.pop(context);
        },
        pageCount: "3/3",
        backgroundColor: mordernPink,
        mainText: "DISCOVER THE TOP \nPERFORMING COMPANIES IN INDIA",
        img: "assets/intro-img/Intro-3.png",
        startButtonState: true,
        backButtonState: true);
  }
}

import 'package:flutter/material.dart';
import 'package:market_news/Presentation/common/colors.dart';
import 'package:market_news/Presentation/screens/Intro/widget/custom-intro.dart';

class FirstIntro extends StatefulWidget {
  const FirstIntro({Key? key}) : super(key: key);

  @override
  State<FirstIntro> createState() => _FirstIntroState();
}

class _FirstIntroState extends State<FirstIntro> {
  @override
  Widget build(BuildContext context) {
    return CustomIntro(
        onTapParams: () {
          Navigator.pushNamed(context, "/nav_bar");
        },
        onTapaaOfStartButton: () {
          Navigator.pushNamed(context, "/splash_second");
        },
        pageCount: "1/3",
        backgroundColor: mordernGreen,
        mainText: "WELCOME TO \nINDIAN FINANCE NEWS \nAPP",
        img: "assets/intro-img/Intro-1.png",
        startButtonState: false,
        backButtonState: false);
  }
}

// width: 393,
// height: 781,
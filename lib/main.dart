import 'package:flutter/material.dart';
import 'package:market_news/Presentation/common/nav_bar.dart';
import 'package:market_news/Presentation/screens/Home/home_page.dart';
import 'package:market_news/Presentation/screens/Intro/first-intro.dart';
import 'package:market_news/Presentation/screens/Intro/second-intro.dart';
import 'package:market_news/Presentation/screens/Intro/third-intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstIntro(),
     // initialRoute: "/home",
      routes: {
        "/home": (context) => const HomePage(),
        "/splash_first": (context) => const FirstIntro(),
        "/splash_second": (context) => const SecondIntro(),
        "/splash_third": (context) => const ThirdIntro(),
        "/nav_bar": (context) => const BottomNavBar(),
      },
    );
  }
}

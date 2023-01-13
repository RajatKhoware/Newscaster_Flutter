// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:market_news/Presentation/common/colors.dart';
import 'package:market_news/Presentation/common/custom-text.dart';
import 'package:market_news/Presentation/screens/Info/text_file.dart';

class InfoAboutApk extends StatelessWidget {
  const InfoAboutApk({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Scaffold(
            backgroundColor: black,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, right: 10.w, top: 5.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: Colors.white, width: 3.w),
                            color: black),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          child: CustomText(
                              text: introText,
                              colors: Colors.white,
                              fontsize: 15.sp,
                              fontFamily: "TS BLOCK",
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.h,
                          horizontal: 5.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 2.w),
                                  color: black),
                              child: Image.asset(
                                "assets/intro-img/angrey_programmer_1.png",
                              ),
                            ),
                            Container(
                              height: 130.h,
                              width: 130.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 2.w),
                                  color: black),
                              child: Image.asset(
                                "assets/intro-img/happy_programmer.png",
                              ),
                            ),
                            Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 2.w),
                                  color: black),
                              child: Image.asset(
                                "assets/intro-img/angrey_programmer.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                      const CustomText(
                          text: 'NEWS APP 📰',
                          colors: Colors.white,
                          fontsize: 30,
                          fontFamily: "TS BLOCK",
                          fontWeight: FontWeight.w400),
                      SizedBox(height: 10.h),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: Colors.white),
                          color: Colors.black,
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(5.0.w.h),
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.all(10.w.h),
                                child: CarouselSlider(
                                  items: imgList
                                      .map((item) => Container(
                                            width: double.infinity,
                                            color: Colors.white,
                                            child: Center(
                                              child: Image.asset(item,
                                                  fit: BoxFit.cover),
                                            ),
                                          ))
                                      .toList(),
                                  options: CarouselOptions(
                                    height: 200.0.h,
                                    enlargeCenterPage: true,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0.w.h),
                                child: CustomText(
                                    text: newsAppText,
                                    colors: Colors.white,
                                    fontsize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      const _CustomInfoBox(
                        headingText: "WHY FLUTTER? 🎯",
                        contentText: whyFlutterText,
                      ),
                      const _CustomInfoBox(
                        headingText: "DESIGN PROCESS 📝",
                        contentText: desginProcessText,
                      ),
                      const _CustomInfoBox(
                        headingText: "CHALLENGES FACED 🤯",
                        contentText: challengesFacedText,
                      ),
                      const _CustomInfoBox(
                        headingText: "ABOUT ME 😎",
                        contentText: aboutText,
                      ),
                      SizedBox(height: 30.h),
                      const CustomText(
                        text: 'CATCH ME HERE ☕',
                        colors: Colors.white,
                        fontsize: 25,
                        fontFamily: "TS BLOCK",
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: Colors.white),
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 8.h),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(children: [
                              _UriLaunchBlock(
                                sourceText: "Linkedin",
                                url: urlForLinkdin,
                                colorOfBlock: Colors.blue,
                              ),
                              _UriLaunchBlock(
                                sourceText: "Github",
                                url: urlForGitHub,
                                colorOfBlock: black,
                              ),
                              _UriLaunchBlock(
                                sourceText: "Instagram",
                                url: urlForInstagram,
                                colorOfBlock:
                                    const Color.fromARGB(241, 255, 0, 174),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          if (await canLaunchUrl(urlForEmail)) {
                            await launchUrl(urlForEmail);
                          } else {
                            throw 'Could not launch $urlForEmail';
                          }
                        },
                        child: const _CustomInfoBox(
                            headingText: "Contact Me",
                            contentText: " • rajatkhoware2002@gmail.com"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class _CustomInfoBox extends StatelessWidget {
  final String headingText;
  final String contentText;
  const _CustomInfoBox({
    Key? key,
    required this.headingText,
    required this.contentText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              CustomText(
                  text: headingText,
                  colors: Colors.white,
                  fontsize: 25,
                  fontFamily: "TS BLOCK",
                  fontWeight: FontWeight.w400),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(color: Colors.white),
                  color: Colors.black,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.w.h),
                        child: CustomText(
                            text: contentText,
                            colors: Colors.white,
                            fontsize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 5.h)
                    ]),
              ),
              SizedBox(height: 20.h)
            ],
          );
        });
  }
}

class _UriLaunchBlock extends StatelessWidget {
  final String sourceText;
  final Uri url;
  final Color colorOfBlock;
  const _UriLaunchBlock({
    Key? key,
    required this.sourceText,
    required this.url,
    required this.colorOfBlock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Container(
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: Colors.white),
                color: colorOfBlock,
              ),
              child: Padding(
                padding: EdgeInsets.all(10.w.h),
                child: Center(
                  child: InkWell(
                    onTap: () async {
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: CustomText(
                      text: sourceText,
                      fontFamily: "TS BLOCK",
                      colors: Colors.white,
                      fontsize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

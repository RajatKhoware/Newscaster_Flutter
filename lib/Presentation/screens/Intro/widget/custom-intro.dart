// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:market_news/Presentation/common/colors.dart';
import 'package:market_news/Presentation/common/custom-text.dart';

class CustomIntro extends StatelessWidget {
  final String pageCount;
  final String mainText;
  final String img;
  final bool startButtonState;
  final bool backButtonState;
  final Color backgroundColor;
  final double? indicatorPercentage;
  final VoidCallback onTapParams;
  final VoidCallback onTapaaOfStartButton;
  final VoidCallback? onTapOfBackButton;

  const CustomIntro({
    Key? key,
    required this.pageCount,
    required this.mainText,
    required this.img,
    required this.startButtonState,
    required this.backButtonState,
    required this.backgroundColor,
    this.indicatorPercentage = 0.33,
    required this.onTapParams,
    required this.onTapaaOfStartButton,
    this.onTapOfBackButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 781),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(12.0.w.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: onTapOfBackButton,
                      child: backButton(backButtonState),
                    ),
                    CustomText(
                        text: pageCount,
                        fontsize: 20.sp,
                        fontWeight: FontWeight.bold,
                        colors: black),
                    InkWell(
                      onTap: onTapParams,
                      child: CustomText(
                          text: "Skip",
                          fontsize: 20.sp,
                          fontWeight: FontWeight.bold,
                          colors: Colors.black.withOpacity(0.6)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                height: 400.h,
                child: Image.asset(
                  img,
                  scale: 3.7,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: CustomText(
                    text: mainText,
                    fontsize: 30.sp,
                    fontWeight: FontWeight.bold,
                    colors: Colors.black),
              ),
              SizedBox(height: 10.h),
              Center(
                  child: InkWell(
                onTap: onTapaaOfStartButton,
                child: startButton(
                  startButtonState,
                  indicatorPercentage!,
                ),
              ))
            ],
          )),
        );
      },
    );
  }
}

Widget startButton(bool isActive, double percentage) {
  return isActive
      ? Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                50.r,
              ),
            ),
            child: Center(
              child: CustomText(
                  colors: Colors.white,
                  fontsize: 15.sp,
                  fontWeight: FontWeight.bold,
                  text: "Start"),
            ),
          ),
        )
      : CircularPercentIndicator(
          radius: 37.r,
          lineWidth: 5.w,
          percent: percentage,
          backgroundWidth: 3.w,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.black.withOpacity(0.8),
          backgroundColor: Colors.black.withOpacity(0.3),
          center: Padding(
            padding: EdgeInsets.only(top: 5.h, left: 5.w),
            child: Image.asset(
              "assets/icons/Forward-icon.png",
            ),
          ),
        );
}

Widget backButton(bool isActive) {
  return isActive
      ? const Icon(Icons.arrow_back)
      : CustomText(
          colors: black,
          fontsize: 20.sp,
          fontWeight: FontWeight.bold,
          text: "");
}

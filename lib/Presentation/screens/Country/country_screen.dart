// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:market_news/Presentation/common/colors.dart';
import 'package:market_news/Presentation/common/custom-text.dart';
import 'package:market_news/Presentation/screens/Country/headlines_from_country.dart';
import 'package:market_news/Presentation/screens/Country/list_of_countries.dart';
import 'package:market_news/main.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Scaffold(
            backgroundColor: mordernBlue,
            body: SafeArea(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w, top: 5.h),
                  child: Container(
                    width: 385.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 15.h),
                        CustomText(
                          text: "TOP HEADLINE'S",
                          colors: Colors.white,
                          fontsize: 20.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "TS BLOCK",
                        ),
                        CustomText(
                          text: "Sort By",
                          colors: Colors.white,
                          fontsize: 15.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "TS BLOCK",
                        ),
                        CustomText(
                          text: "COUNTRIES",
                          colors: Colors.white,
                          fontsize: 30.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "TS BLOCK",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView(
                    children: [
                      for (var country in countries)
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HeadlinesFromCountryPage(
                                  countryName: country['name'],
                                  countryCodes: country['code'],
                                ),
                              ),
                            );
                          },
                          child: CountryList(
                            countryName: country['name'],
                            countryCode: country['code'],
                            countyFlag: country['flag'],
                          ),
                        ),
                    ],
                  ),
                )
              ],
            )),
          );
        });
  }
}

class CountryList extends StatelessWidget {
  final String? countryName;
  final String? countryCode;
  final String? countyFlag;
  const CountryList({
    Key? key,
    required this.countryName,
    required this.countryCode,
    required this.countyFlag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            child: Container(
              width: 300.w,
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: mordernBlue,
                border: Border.all(width: 1.w, color: black),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50.w,
                            height: 30.h,
                            child: Image.asset(countyFlag!),
                          ),
                          SizedBox(width: 20.w),
                          CustomText(
                            text: countryName!,
                            colors: Colors.black,
                            fontsize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "TS BLOCK",
                          ),
                        ],
                      ),
                      SizedBox(width: 10.w),
                      CustomText(
                        text: countryCode!,
                        colors: Colors.black,
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "TS BLOCK",
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}

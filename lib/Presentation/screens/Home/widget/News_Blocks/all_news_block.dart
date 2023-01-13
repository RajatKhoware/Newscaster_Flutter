// ignore_for_file: public_member_api_docs, sort_constructors_first

import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timeago/timeago.dart ' as timeago;

import 'package:market_news/Presentation/common/colors.dart';
import 'package:market_news/Data/dataproviders/api_testing.dart';

import '../../../../common/custom-text.dart';
import '../../../../../Data/models/top_headlines.dart';
import '../../../../common/custom_img.dart';

class NewsSortByEverything extends StatelessWidget {
  final Future<News> futureParams;
  const NewsSortByEverything({
    Key? key,
    required this.futureParams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Container(
            height: 520.h,
            color: mordernPurple,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 1.5.h,
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 15.w, bottom: 10.h),
                child: CustomText(
                    text: "EVERYTHING",
                    colors: Colors.black,
                    fontsize: 30.sp,
                    fontFamily: "TS BLOCK",
                    fontWeight: FontWeight.w900),
              ),
              FutureBuilder<News>(
                  future: futureParams,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      News? news = snapshot.data;
                      if (news!.articles.isNotEmpty) {
                        return SizedBox(
                          height: 450.h,
                          width: 440.w,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: news.articles.length,
                              itemBuilder: (context, index) {
                                Article article = news.articles[index];
                                if (article.title.isNotEmpty &&
                                    article.description.isNotEmpty &&
                                    article.urlToImage.isNotEmpty &&
                                    article.publishedAt.isNotEmpty) {
                                  return EverythingBox(
                                      titleText: article.title,
                                      imgUrl: article.urlToImage,
                                      descriptionText: article.description,
                                      timeOfNews: timeago.format(
                                          DateTime.parse(article.publishedAt)));
                                } else {
                                  return Center(
                                    child: Text(
                                      "An error occurred while loading the data. Please try again later.",
                                      style: TextStyle(fontSize: 20.sp),
                                    ),
                                  );
                                }
                              }),
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Center(child: Text("${snapshot.error}"));
                    } else {
                      return Center(
                        child: SpinKitPulse(size: 50.sp, color: Colors.black),
                      );
                    }
                    return const SizedBox();
                  }),
              SizedBox(height: 10.h),
              Container(
                height: 1.5.h,
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
              ),
            ]),
          );
        });
  }
}

class EverythingBox extends StatelessWidget {
  final String titleText;
  final String imgUrl;
  final String descriptionText;
  final String timeOfNews;
  const EverythingBox({
    Key? key,
    required this.titleText,
    required this.imgUrl,
    required this.descriptionText,
    required this.timeOfNews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
            child: Container(
              width: double.infinity,
              height: 395.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r)),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 15.w, top: 10.h, right: 10.w),
                        child: CustomText(
                          text: titleText,
                          fontsize: 25.sp,
                          fontWeight: FontWeight.w500,
                          colors: Colors.black,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w, right: 10.w),
                        child: FramedImg(
                            width: 320.w,
                            height: 160.h,
                            imgUrl: imgUrl,
                            topPadding: 10.h,
                            leftPadding: 10.w),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w, right: 10.w),
                        child: CustomText(
                          text: descriptionText,
                          fontsize: 13.sp,
                          fontWeight: FontWeight.w500,
                          colors: Colors.black,
                          fontFamily: "Sequel Sans Roman",
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Icon(
                              Icons.heart_broken,
                              size: 24.sp,
                              color: Colors.black,
                            ),
                            SizedBox(width: 5.w),
                            Icon(
                              Icons.volume_up,
                              size: 24.sp,
                              color: Colors.black,
                            ),
                            SizedBox(width: 120.w),
                            Icon(
                              Icons.access_time,
                              size: 24.sp,
                              color: Colors.black,
                            ),
                            SizedBox(width: 5.w),
                            CustomText(
                              text: timeOfNews,
                              fontsize: 14.sp,
                              fontWeight: FontWeight.w500,
                              colors: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          );
        });
  }
}

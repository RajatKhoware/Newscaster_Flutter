// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:market_news/Presentation/common/custom_img.dart';
import 'package:market_news/Data/dataproviders/api_testing.dart';

import '../../../../common/colors.dart';
import '../../../../common/custom-text.dart';
import '../../../../../Data/models/top_headlines.dart';

class NewsSortByHotNews extends StatelessWidget {
  final VoidCallback onTapParams;
  final Future<News> futureParams;
  const NewsSortByHotNews({
    Key? key,
    required this.onTapParams,
    required this.futureParams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.all(8.0.w.h),
            child: Container(
              height: 490.h,
              color: Colors.black,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 12.h, left: 12.w),
                  child: Row(
                    children: [
                      CustomText(
                          text: "HOT NEWS",
                          colors: Color.fromARGB(255, 255, 94, 94),
                          fontsize: 20.sp,
                          fontFamily: "TS BLOCk",
                          fontWeight: FontWeight.w900),
                      SizedBox(width: 6.w),
                      Container(
                        height: 2.h,
                        width: 175.w,
                        color: Colors.white.withOpacity(0.7),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                FutureBuilder<News>(
                  future: futureParams,
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      News? news = snapShot.data;
                      if (news!.articles.isNotEmpty) {
                        return SizedBox(
                          height: 120.h * 3,
                          width: 370.w,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              Article article = news.articles[index];
                              if (article.title.isNotEmpty &&
                                  article.author.isNotEmpty &&
                                  article.urlToImage.isNotEmpty) {
                                return Column(
                                  children: [
                                    HotNewBox1(
                                        title: news.articles[0].title,
                                        authorName: news.articles[0].author,
                                        imgUrl: news.articles[0].urlToImage),
                                    HotNewBox2(
                                        title: news.articles[1].title,
                                        authorName: news.articles[1].author,
                                        imgUrl: news.articles[1].urlToImage),
                                    HotNewBox1(
                                        title: news.articles[2].title,
                                        authorName: news.articles[2].author,
                                        imgUrl: news.articles[2].urlToImage),
                                    HotNewBox2(
                                        title: news.articles[3].title,
                                        authorName: news.articles[3].author,
                                        imgUrl: news.articles[3].urlToImage),
                                  ],
                                );
                              } else {
                                return const Text("");
                              }
                            },
                          ),
                        );
                      }
                    } else {
                      return Center(
                        child: SpinKitPulse(size: 50.sp, color: Colors.black),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: onTapParams,
                  child: Container(
                    width: 300.w,
                    height: 40.h,
                    color: Colors.white,
                    child: Center(
                      child: CustomText(
                          text: "READ MORE",
                          colors: Color.fromARGB(255, 255, 94, 94),
                          fontsize: 20.sp,
                          fontFamily: "TS BLOCK",
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ]),
            ),
          );
        });
  }
}

//  FutureBuilder<News>(
//             future: apiCalling.fetchNews(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 News news = snapshot.hasData as News;
//                 if (news.articles.isNotEmpty) {
//                   return ListView.builder(
//                     itemCount: 4,
//                     itemBuilder: (context, index) {
//                       Article article = news.articles[index];
//                       if (article.title.isNotEmpty &&
//                           article.author.isNotEmpty &&
//                           article.urlToImage.isNotEmpty) {
//                         return Column(
//                           children: [],
//                         );
//                       }
//                       else{
//                         return const Text("");
//                       }
//                     },
//                   );
//                 }
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator.adaptive(),
//                 );
//               }
//               return SizedBox();
//             },
//           ),

class HotNewBox1 extends StatelessWidget {
  final String title;
  final String authorName;
  final String imgUrl;

  const HotNewBox1({
    Key? key,
    required this.title,
    required this.authorName,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return SizedBox(
            height: 126.h,
            child: Padding(
              padding: EdgeInsets.only(top: 10.h, left: 5.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FramedImg(
                      width: 180.w,
                      height: 100.h,
                      containerColor: Colors.white,
                      imgUrl: imgUrl,
                      topPadding: 7.h,
                      leftPadding: 9.w),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: 150.w,
                        child: CustomText(
                            text: title,
                            colors: Colors.white,
                            fontsize: 15.sp,
                            maxLines: 3,
                            fontFamily: "Sequel Sans Roman",
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        width: 140.w,
                        height: 33.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.w,
                              color: Colors.grey,
                            ),
                            color: Colors.white),
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 7.w, top: 3.h, right: 6.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: CustomText(
                                      text: authorName,
                                      colors: black.withOpacity(0.8),
                                      fontsize: 12.sp,
                                      maxLines: 1,
                                      fontFamily: "TS BLOCK",
                                      fontWeight: FontWeight.w400),
                                ),
                                CustomText(
                                    text: " News Author",
                                    colors: black.withOpacity(0.6),
                                    fontsize: 10.sp,
                                    maxLines: 1,
                                    fontFamily: "",
                                    fontWeight: FontWeight.w600),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class HotNewBox2 extends StatelessWidget {
  final String title;
  final String authorName;
  final String imgUrl;
  const HotNewBox2({
    Key? key,
    required this.title,
    required this.authorName,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return SizedBox(
            height: 126.h,
            child: Padding(
              padding: EdgeInsets.only(top: 10.h, left: 15.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: 150.w,
                        child: CustomText(
                            text: title,
                            colors: Colors.white,
                            fontsize: 15.sp,
                            maxLines: 3,
                            fontFamily: "Sequel Sans Roman",
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        width: 140.w,
                        height: 33.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.w,
                              color: Colors.grey,
                            ),
                            color: Colors.white),
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 7.w, top: 3.h, right: 6.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: CustomText(
                                      text: authorName,
                                      colors: black.withOpacity(0.8),
                                      fontsize: 12.sp,
                                      maxLines: 1,
                                      fontFamily: "TS BLOCK",
                                      fontWeight: FontWeight.w500),
                                ),
                                CustomText(
                                    text: " News Author",
                                    colors: black.withOpacity(0.6),
                                    fontsize: 10.sp,
                                    maxLines: 1,
                                    fontFamily: "",
                                    fontWeight: FontWeight.w600),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w),
                  FramedImg(
                      width: 180.w,
                      height: 100.h,
                      containerColor: Colors.white,
                      imgUrl: imgUrl,
                      topPadding: 7.h,
                      leftPadding: 9.w),
                ],
              ),
            ),
          );
        });
  }
}

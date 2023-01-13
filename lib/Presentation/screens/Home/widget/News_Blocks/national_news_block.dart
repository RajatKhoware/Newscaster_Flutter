// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:market_news/Presentation/common/colors.dart';

import '../../../../common/custom-text.dart';
import '../../../../../Data/models/top_headlines.dart';
import '../../../../common/custom_img.dart';

class NewsSortByNation extends StatelessWidget {
  final VoidCallback onTapParams;
  final Future<News> futureParams;
  const NewsSortByNation({
    Key? key,
    required this.onTapParams,
    required this.futureParams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Container(
            color: mordernPurple,
            width: double.infinity,
            height: 250.h,
            child: FutureBuilder<News>(
                future: futureParams,
                builder: (context, snapshot) {
                  News? news = snapshot.data;
                  if (news != null && news.articles.isNotEmpty) {
                    Article article = news.articles[0];
                    if (article.title.isNotEmpty &&
                        article.description.isNotEmpty &&
                        article.urlToImage.isNotEmpty) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, top: 5.h, right: 10.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FramedImg(
                                    width: 120.w,
                                    height: 225.h,
                                    imgUrl: article.urlToImage,
                                    topPadding: 10.h,
                                    leftPadding: 10.w),
                                SizedBox(width: 20.w),
                                SizedBox(
                                  width: 210.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      UnderLineText(
                                        text: "NATIONAL",
                                        fontsize: 18.sp,
                                        width: 100.w,
                                        height: 15.h,
                                        paddingVertical: 10,
                                        underlineColor: mordernYellow,
                                      ),
                                      CustomText(
                                        text: article.title,
                                        fontsize: 24.sp,
                                        fontWeight: FontWeight.w600,
                                        colors: Colors.black,
                                        maxLines: 2,
                                      ),
                                      SizedBox(height: 10.h),
                                      CustomText(
                                        text: article.description,
                                        fontsize: 13.7.sp,
                                        fontWeight: FontWeight.w500,
                                        colors: Colors.black,
                                        fontFamily: "Sequel Sans Roman",
                                        maxLines: 5,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 12.w, top: 15.h),
                                        child: InkWell(
                                          onTap: onTapParams,
                                          child: FramedImgAssets(
                                              width: 170.w,
                                              height: 30.h,
                                              imgUrl:
                                                  "assets/text/read_more.png",
                                              topPadding: 5.h,
                                              leftPadding: 5.w),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
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
          );
        });
  }
}

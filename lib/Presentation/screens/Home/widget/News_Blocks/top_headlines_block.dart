// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:market_news/Presentation/common/colors.dart';
import 'package:market_news/Presentation/common/custom_img.dart';
import 'package:market_news/Data/dataproviders/api_testing.dart';

import '../../../../common/custom-text.dart';
import '../../../../../Data/models/top_headlines.dart';

class TopHeadlineBlock extends StatelessWidget {
  final VoidCallback onTapParams;
  final Future<News> futureParams;
  const TopHeadlineBlock({
    Key? key,
    required this.onTapParams,
    required this.futureParams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return SizedBox(
            width: double.infinity,
            height: 445.h,
            child: FutureBuilder<News>(
                future: futureParams,
                builder: (context, snapshot) {
                  News? news = snapshot.data;
                  if (news != null && news.articles.isNotEmpty) {
                    Article article = news.articles[0];

                    // Parse the date string
                    final publishedDate = DateTime.parse(article.publishedAt);
                    // Get the current time
                    final currentDate = DateTime.now();
                    // Calculate the difference between the current time and the published time
                    final difference = currentDate.difference(publishedDate);
                    // Calculate the number of hours
                    String timeAgo;
                    // If the difference is less than one hour, display the difference in minutes
                    if (difference.inHours == 0) {
                      final minutes = difference.inMinutes;
                      timeAgo = '$minutes min ago';
                    }
                    // If the difference is less than one day, display the difference in hours
                    else if (difference.inDays == 0) {
                      final hours = difference.inHours;
                      timeAgo = '$hours hours ago';
                    }
                    // If the difference is more than one day, display the difference in days
                    else if (difference.inDays < 30) {
                      final days = difference.inDays;
                      timeAgo = '$days days ago';
                    } else {
                      final months = difference.inDays ~/ 30;
                      timeAgo = '$months month ago';
                    }

                    if (article.title.isNotEmpty &&
                        article.description.isNotEmpty &&
                        article.urlToImage.isNotEmpty) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15.w, top: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: onTapParams,
                                  child: UnderLineText(
                                    text: "HEADLINE",
                                    fontsize: 18.sp,
                                    width: 100.w,
                                    height: 15.h,
                                    paddingVertical: 12.h,
                                    underlineColor: mordernGreen,
                                  ),
                                ),
                                CustomText(
                                  text: article.title,
                                  fontsize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                  colors: Colors.black,
                                  maxLines: 1,
                                ),
                                SizedBox(height: 20.h),
                                FramedImg(
                                    width: 350.w,
                                    height: 180.h,
                                    imgUrl: article.urlToImage,
                                    topPadding: 10.h,
                                    leftPadding: 10.w),
                                SizedBox(height: 20.h),
                                CustomText(
                                  text: article.description,
                                  fontsize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  colors: Colors.black,
                                  fontFamily: "Sequel Sans Roman",
                                  maxLines: 3,
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.heart,
                                      size: 25.sp,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 20.w),
                                    Icon(
                                      Icons.volume_up,
                                      size: 25.sp,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 150.w),
                                    Icon(
                                      Icons.access_time,
                                      size: 25.sp,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 5.w),
                                    SizedBox(
                                      width: 125.w,
                                      height: 20.h,
                                      child: CustomText(
                                        text: timeAgo.toString(),
                                        fontsize: 17,
                                        fontWeight: FontWeight.w500,
                                        colors: Colors.black,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Divider(
                            height: 1.0.h,
                            thickness: 1.5.h,
                            color: Colors.black.withOpacity(0.2),
                          ),
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

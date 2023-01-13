// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:market_news/Data/dataproviders/api_testing.dart';
import 'package:market_news/Presentation/common/colors.dart';
import 'package:market_news/Presentation/common/custom-text.dart';
import '../../../../../Data/models/top_headlines.dart';
import '../../../../common/custom_img.dart';

class NewsContentScreen extends StatelessWidget {
  final bool endpointEverthing;
  final String? qKeyword;
  final String? sources;
  final String? language;
  final String? sortBy;
  final String? from;
  final String? to;
  final String? topHeadlinesQ;
  final String? topHeadlinesCountry;
  final String? topHeadlinesCategory;
  final String? topHeadlinesSource;
  final UnderLineText underLineText;
  const NewsContentScreen({
    Key? key,
    required this.endpointEverthing,
    this.qKeyword = '',
    this.sources = '',
    this.language = '',
    this.sortBy = '',
    this.from = '',
    this.to = '',
    this.topHeadlinesQ = '',
    this.topHeadlinesCountry = '',
    this.topHeadlinesCategory = '',
    this.topHeadlinesSource = '',
    required this.underLineText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var apiCalling = ApiCalling();
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Scaffold(
            backgroundColor: mordernBlue,
            appBar: AppBar(
              backgroundColor: mordernBlue,
              elevation: 0.5,
              leading: IconButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              actions: [
                Icon(
                  Icons.text_fields,
                  color: Colors.black,
                ),
                SizedBox(width: 10.w),
                Icon(
                  Icons.volume_up,
                  color: Colors.black,
                ),
                SizedBox(width: 10.w),
                Icon(
                  Icons.share,
                  color: Colors.black,
                ),
                SizedBox(width: 25.w),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(1.0.h),
                child: Divider(
                  height: 1.0.h,
                  thickness: 1.5.h,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w, top: 10.h),
                        child: underLineText,
                      ),
                      ContentBoxWidget(
                        futureParams: endpointEverthing
                            ? apiCalling.fetchNews(
                                endpointEverthing: endpointEverthing,
                                qKeyword: qKeyword!,
                                sources: sources!,
                                language: language!,
                                sortBy: sortBy!,
                                from: from!,
                                to: to!,
                              )
                            : apiCalling.fetchNews(
                                endpointEverthing: endpointEverthing,
                                topHeadlinesQ: topHeadlinesQ!,
                                topHeadlinesCountry: topHeadlinesCountry!,
                                topHeadlinesCategory: topHeadlinesCategory!,
                                topHeadlinesSource: topHeadlinesSource!,
                              ),
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}

class ContentBoxWidget extends StatelessWidget {
  final Future<News> futureParams;
  const ContentBoxWidget({
    Key? key,
    required this.futureParams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return FutureBuilder<News>(
              future: futureParams,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  News? news = snapshot.data;
                  if (news != null && news.articles.isNotEmpty) {
                    return SizedBox(
                      height: 700.h,
                      width: double.infinity,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: news.articles.length,
                          itemBuilder: (context, index) {
                            Article article = news.articles[index];
                            // Parse the date string
                            final date = DateTime.parse(article.publishedAt);
                            // Create a DateFormat instance with the desired format
                            final formatter = DateFormat.yMMMd();
                            // Format the date
                            final formattedDate = formatter.format(date);
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(15.w.h),
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (article.title != null)
                                          CustomText(
                                            text: article.title,
                                            fontsize: 30.sp,
                                            fontWeight: FontWeight.w600,
                                            colors: Colors.black,
                                          )
                                        else
                                          const Text("No Results Found"),
                                        SizedBox(height: 20.h),
                                        if (article.urlToImage != null)
                                          FramedImg(
                                              width: 340.w,
                                              height: 170.h,
                                              imgUrl: article.urlToImage,
                                              topPadding: 10.h,
                                              leftPadding: 13.w)
                                        else
                                          FramedImgAssets(
                                              width: 340.w,
                                              height: 170.h,
                                              imgUrl:
                                                  "assets/text/no_results.webp",
                                              topPadding: 10.h,
                                              leftPadding: 13.w),
                                        SizedBox(height: 20.h),
                                        UnderLineText(
                                            text: "DESCRIPTION",
                                            fontsize: 20.sp,
                                            width: 200.w,
                                            height: 15.h,
                                            paddingVertical: 8.h,
                                            fontWeightt: FontWeight.w400,
                                            fontFamily: "TS BLOCK",
                                            underlineColor: mordernYellow),
                                        SizedBox(height: 10.h),
                                        if (article.description != null)
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w, right: 5.w),
                                            child: CustomText(
                                              text: article.description,
                                              fontsize: 17.sp,
                                              maxLines: 10,
                                              fontWeight: FontWeight.w400,
                                              colors: Colors.black,
                                              fontFamily: "Sequel Sans",
                                            ),
                                          )
                                        else
                                          const Text("No Results Found"),
                                        SizedBox(height: 20.h),
                                        UnderLineText(
                                            text: "CONTENT",
                                            fontsize: 20.sp,
                                            width: 139.w,
                                            height: 15.h,
                                            paddingVertical: 8.h,
                                            fontWeightt: FontWeight.w500,
                                            fontFamily: "TS BLOCK",
                                            underlineColor: mordernYellow),
                                        SizedBox(height: 10.h),
                                        if (article.content != null)
                                          CustomText(
                                            text: article.content,
                                            fontsize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            colors: Colors.black,
                                            fontFamily: "Sequel Sans",
                                          )
                                        else
                                          const Text("No Results Found"),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1.0.h,
                                  thickness: 1.5.h,
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w,
                                      right: 15.w,
                                      top: 10.h,
                                      bottom: 10.h),
                                  child: SizedBox(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (article.author != null)
                                                SizedBox(
                                                  width: 200.w,
                                                  child: CustomText(
                                                      text: article.author,
                                                      colors: Colors.black,
                                                      fontsize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              else if (article.source.name !=
                                                  null)
                                                SizedBox(
                                                  width: 200.w,
                                                  child: CustomText(
                                                      text: article.source.name,
                                                      colors: Colors.black,
                                                      fontsize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              else
                                                CustomText(
                                                    text: "Null",
                                                    colors: Colors.black,
                                                    fontsize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              SizedBox(height: 5.h),
                                              CustomText(
                                                  text:
                                                      "Published at $formattedDate",
                                                  colors: Colors.black,
                                                  fontsize: 16.sp,
                                                  fontWeight: FontWeight.w200)
                                            ],
                                          ),
                                          FramedImgAssets(
                                              width: 90.w,
                                              height: 25.h,
                                              imgUrl: "assets/text/follow.png",
                                              topPadding: 5.h,
                                              leftPadding: 5.w)
                                        ]),
                                  ),
                                ),
                                Divider(
                                  height: 1.0.h,
                                  thickness: 1.5.h,
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ],
                            );
                          }),
                    );
                  }
                } else {
                  return Center(
                    child: SpinKitPulse(size: 50.sp, color: Colors.black),
                  );
                }
                return const SizedBox();
              });
        });
  }
}

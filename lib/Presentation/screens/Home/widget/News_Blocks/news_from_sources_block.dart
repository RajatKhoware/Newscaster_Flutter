// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:market_news/Presentation/common/colors.dart';
import '../../../../common/custom-text.dart';
import '../../../../../Data/models/top_headlines.dart';

class NewsSortBySource extends StatelessWidget {
  final bool isNewsFromAuthor;
  final String headingText;
  final VoidCallback onTapParams;
  final Future<News> futureParams;

  const NewsSortBySource({
    Key? key,
    required this.isNewsFromAuthor,
    required this.headingText,
    required this.onTapParams,
    required this.futureParams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.all(5.0.w.h),
            child: Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                color: mordernPurple,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  width: 2.0.w,
                  color: black.withOpacity(0.3),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, left: 20.w),
                      child: UnderLineText(
                        text: headingText,
                        fontsize: 20.sp,
                        width: 82.w,
                        height: 15.h,
                        underlineColor: mordernPink,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: 40.h,
                            width: 350.w,
                            child: FutureBuilder<News>(
                              future: futureParams,
                              builder: (context, snapShot) {
                                if (snapShot.hasData) {
                                  News? news = snapShot.data;
                                  if (news!.articles.isNotEmpty) {
                                    //Instead of using a Set to store the unique data, you can use a Map where the key is the source name
                                    //and the value is a boolean indicating whether the source name has been seen before. You can then use
                                    //this Map to check whether a source name has been seen before and add it to the Map if it hasn't.
                                    Map<String, bool> seenSources = {};
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: news.articles.length,
                                      itemBuilder: (context, index) {
                                        Article article = news.articles[index];
                                        var fromSource = isNewsFromAuthor
                                            ? article.author
                                            : article.source.name;
                                        if (fromSource != null &&
                                            !seenSources
                                                .containsKey(fromSource)) {
                                          seenSources[fromSource] = true;
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.w),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1.0.w,
                                                    color: Colors.black,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  color: black),
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.all(10.0.w.h),
                                                child: InkWell(
                                                  onTap: onTapParams,
                                                  child: CustomText(
                                                      text: fromSource,
                                                      colors: Colors.white,
                                                      fontsize: 13.sp,
                                                      fontFamily:
                                                          "Sequel Sans Roman",
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return const Text("");
                                        }
                                      },
                                    );
                                  } else {
                                    return const Text("No articles found.");
                                  }
                                } else if (snapShot.hasError) {
                                  return Text(
                                      "Error retrieving data: ${snapShot.error}");
                                } else {
                                  return Center(
                                    child: SpinKitPulse(
                                        size: 50.sp, color: Colors.black),
                                  );
                                }
                              },
                            ),
                          )),
                    ),
                  ]),
            ),
          );
        });
  }
}

// class SourceBox extends StatelessWidget {
//   final bool fromAuthors;
//   const SourceBox({
//     Key? key,
//     required this.fromAuthors,
//   }) : super(key: key);

//   Widget build(BuildContext context) {
   
//     return
//   }
// }

// class DomainBox extends StatelessWidget {
//   final bool? fromAuthors;
//   const DomainBox({
//     Key? key,
//     this.fromAuthors = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var apiCalling = ApiCalling();
//     bool fromAuthor = fromAuthors!;
//     return SizedBox(
//       height: 40,
//       width: 350,
//       child: FutureBuilder<News>(
//         future: apiCalling.fetchNews(
//           endpointEverthing: true,
//           qKeyword: "investing",
//         ),
//         builder: (context, snapShot) {
//           if (snapShot.hasData) {
//             News? news = snapShot.data;
//             if (news!.articles.isNotEmpty) {
//               return ListView.builder(
//                 itemCount: 100,
//                 itemBuilder: (context, index) {
//                   Article article = news.articles[index];
//                   if (article.author.isNotEmpty) {
//                     return Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                               width: 1.0,
//                               color: Colors.black,
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                             color: black),
//                         child: const Padding(
//                           padding: EdgeInsets.all(10.0),
//                           child: CustomText(
//                               text: "",
//                               colors: Colors.white,
//                               fontsize: 13,
//                               fontFamily: "Sequel Sans Roman",
//                               fontWeight: FontWeight.w900),
//                         ),
//                       ),
//                     );
//                   } else {
//                     return const Text("");
//                   }
//                 },
//               );
//             }
//           } else if (snapShot.hasError) {
//             return Center(
//               child: Text("${snapShot.error}"),
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator.adaptive(),
//             );
//           }
//           return const SizedBox();
//         },
//       ),
//     );
//   }
// }

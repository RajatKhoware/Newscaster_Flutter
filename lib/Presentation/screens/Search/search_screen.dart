import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_news/Presentation/common/colors.dart';
import 'package:market_news/Presentation/screens/Home/pages/TabBar/content_page.dart';
import '../../../Data/dataproviders/api_testing.dart';
import '../../../Data/models/top_headlines.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  News? news;
  Future<News> futureParams =
      Future.value(SearchApiCalling().fetchNews(qKeyword: "India"));

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController(text: "India");
    final apiCalling = SearchApiCalling();

    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Scaffold(
            backgroundColor: mordernLightPurple,
            body: SafeArea(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.w.h),
                  child: TextField(
                    controller: searchController,
                    style: const TextStyle(
                      fontFamily: "Sequel Sans",
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: "Start Searching ...",
                      hintStyle: const TextStyle(
                        fontFamily: "Sequel Sans",
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: GestureDetector(
                        child: GestureDetector(
                          onTap: () async {
                            final newNews = await apiCalling.fetchNews(
                              qKeyword: searchController.text,
                            );
                            setState(() {
                              // update the value of futureParams
                              futureParams = Future.value(newNews);
                            });
                          },
                          child: const Icon(
                            CupertinoIcons.search,
                            color: black,
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0.r),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0.r),
                        ),
                        borderSide: BorderSide(width: 2.w, color: Colors.black),
                      ),
                      focusColor: Colors.black,
                      prefixStyle: const TextStyle(color: Colors.black),
                    ),
                    onChanged: (text) async {
                      print("Text field value changed: $text");
                    },
                  ),
                ),
                Expanded(
                  child: ContentBoxWidget(
                    futureParams: futureParams,
                  ),
                )
              ],
            )),
          );
        });
  }
}


// String? searchTerm = '';
//     Future<News>? newsFuture;

//     void onSearchChanged() {
//       setState(() {
//         searchTerm = searchController.text;
//       });
//     }

//     @override
//     void initState() {
//       super.initState();
//       searchController.addListener(onSearchChanged);
//     }

//     @override
//     void dispose() {
//       searchController.dispose();
//       super.dispose();
//     }

//     void fetchNews() {
//       setState(() {
//         newsFuture = apiCalling.fetchNews(qKeyword: "india");
//       });
//     }
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:market_news/Data/dataproviders/api_testing.dart';
import 'package:market_news/Presentation/screens/Home/widget/News_Blocks/all_news_block.dart';
import 'package:market_news/Presentation/screens/Home/widget/News_Blocks/hot_news_block.dart';
import 'package:market_news/Presentation/screens/Home/widget/News_Blocks/national_news_block.dart';
import 'package:market_news/Presentation/common/colors.dart';
import 'package:market_news/Presentation/common/custom-text.dart';

import '../../widget/News_Blocks/news_from_sources_block.dart';
import '../../widget/News_Blocks/top_headlines_block.dart';

class TabBarCommonData extends StatelessWidget {
  final String category;
  final UnderLineText underLineText;

  const TabBarCommonData({
    Key? key,
    required this.category,
    required this.underLineText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var apiCalling = ApiCalling();

    return Scaffold(
      backgroundColor: mordernPurple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeadlineBlock(
              futureParams: apiCalling.fetchNews(
                endpointEverthing: false,
                topHeadlinesQ: category,
              ),
              onTapParams: () {
                NavigationUtils.navigateToNewsContentScreen(
                  context,
                  endpointEverthing: false,
                  topHeadlinesQ: category,
                  underLineText: underLineText,
                );
              },
            ),
            NewsSortByNation(
              futureParams: apiCalling.fetchNews(
                endpointEverthing: true,
                qKeyword: category,
              ),
              onTapParams: () {
                NavigationUtils.navigateToNewsContentScreen(
                  context,
                  endpointEverthing: true,
                  qKeyword: category,
                  underLineText: underLineText,
                );
              },
            ),
            NewsSortBySource(
              headingText: "SOURCE",
              isNewsFromAuthor: false,
              futureParams: apiCalling.fetchNews(
                endpointEverthing: true,
                qKeyword: category,
              ),
              onTapParams: () {
                NavigationUtils.navigateToNewsContentScreen(
                  context,
                  endpointEverthing: true,
                  qKeyword: category,
                  underLineText: underLineText,
                  // topHeadlinesSource: article.source.id,
                );
              },
            ),
            NewsSortBySource(
              headingText: "DOMAIN",
              isNewsFromAuthor: true,
              futureParams: apiCalling.fetchNews(
                endpointEverthing: true,
                qKeyword: category,
              ),
              onTapParams: () {
                NavigationUtils.navigateToNewsContentScreen(
                  context,
                  endpointEverthing: true,
                  qKeyword: category,
                  underLineText: underLineText,
                  // topHeadlinesSource: article.source.id,
                );
              },
            ),
            NewsSortByHotNews(
              futureParams: apiCalling.fetchNews(
                endpointEverthing: true,
                qKeyword: category,
                sortBy: "popularity",
              ),
              onTapParams: () {
                NavigationUtils.navigateToNewsContentScreen(
                  context,
                  endpointEverthing: true,
                  qKeyword: category,
                  sortBy: "popularity",
                  underLineText: underLineText,
                );
              },
            ),
            NewsSortByEverything(
              futureParams: apiCalling.fetchNews(
                endpointEverthing: true,
                qKeyword: category,
              ),
            )
          ],
        ),
      ),
    );
  }
}

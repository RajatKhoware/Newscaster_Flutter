// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../../../Data/models/top_headlines.dart';

typedef ArticleWidgetBuilder = Widget Function(Article article);

class _ReuseableFutureBuilder extends StatelessWidget {
  final Future<News> futureParams;
  final bool Function(Article) checkIfValid;
  final ArticleWidgetBuilder articleWidgetBuilder;
  final double heightOfBox;

  const _ReuseableFutureBuilder({
    Key? key,
    required this.futureParams,
    required this.checkIfValid,
    required this.articleWidgetBuilder,
    required this.heightOfBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightOfBox,
      child: FutureBuilder<News>(
        future: futureParams,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            News? news = snapShot.data;
            if (news!.articles.isNotEmpty) {
              Article article = news.articles[0];
              if (checkIfValid(article)) {
                return articleWidgetBuilder(article);
              } else {
                return const Text("");
              }
            }
          } else if (snapShot.hasError) {
            return Center(child: Text("${snapShot.error}"));
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

 // _ReuseableFutureBuilder(
            //   futureParams: apiCalling.fetchNews(
            //     endpointEverthing: false,
            //     topHeadlinesQ: "Stock",
            //   ),
            //   heightOfBox: 469,
            //   checkIfValid: (article) {
            //     return article.title.isNotEmpty &&
            //         article.urlToImage.isNotEmpty &&
            //         article.description.isNotEmpty &&
            //         article.publishedAt.isNotEmpty;
            //   },
            //   articleWidgetBuilder: (article) => TopHeadlineBlock(
            //     titleText: article.title,
            //     imgUrl: article.urlToImage,
            //     descriptionText: article.description,
            //     timeOfNews: timeago.format(DateTime.parse(article.publishedAt)),
            //   ),
            // ),
            // _ReuseableFutureBuilder(
            //   futureParams: apiCalling.fetchNews(
            //     endpointEverthing: false,
            //     topHeadlinesQ: "invest",
            //   ),
            //   heightOfBox: 280,
            //   checkIfValid: (article) {
            //     return article.title.isNotEmpty &&
            //         article.urlToImage.isNotEmpty &&
            //         article.description.isNotEmpty;
            //   },
            //   articleWidgetBuilder: (article) =>
            //    NewsSortByNation(
            //     titleText: article.title,
            //     imgUrl: article.urlToImage,
            //     descriptionText: article.description,
            //   ),
            // ),
//  SizedBox(
//               height: 469,
//               child: FutureBuilder<News>(
//                 future: apiCalling.fetchNews(
//                     endpointEverthing: false, topHeadlinesQ: 'all'),
//                 builder: (context, snapShot) {
//                   if (snapShot.hasData) {
//                     News? news = snapShot.data;
//                     if (news!.articles.isNotEmpty) {
//                       Article article = news.articles[0];
//                       if (article.title != null &&
//                           article.urlToImage != null &&
//                           article.description != null &&
//                           article.publishedAt != null) {
//                         return ListView(
//                           children: [],
//                         );
//                       } else {
//                         return const Text("");
//                       }
//                     }
//                   } else if (snapShot.hasError) {
//                     return Text("${snapShot.error}");
//                   } else {
//                     return const Center(
//                       child: CircularProgressIndicator.adaptive(),
//                     );
//                   }
//                   return const SizedBox();
//                 },
//               ),
//             ),

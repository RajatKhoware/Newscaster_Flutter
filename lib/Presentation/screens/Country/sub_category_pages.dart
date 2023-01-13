// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:market_news/Data/dataproviders/api_testing.dart';

import '../Home/pages/TabBar/content_page.dart';

class CountryCategoryBusiness extends StatelessWidget {
  final String countryCode;

  const CountryCategoryBusiness({
    Key? key,
    required this.countryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var apiCalling = CountryApiClass();
    return Container(
      child: SingleChildScrollView(
        child: ContentBoxWidget(
          futureParams: apiCalling.fetchNews(
            countryCode: countryCode,
            category: "business",
          ),
        ),
      ),
    );
  }
}

class CountryCategoryTechnology extends StatelessWidget {
  final String countryCode;

  const CountryCategoryTechnology({
    Key? key,
    required this.countryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var apiCalling = CountryApiClass();
    return Container(
      child: SingleChildScrollView(
        child: ContentBoxWidget(
          futureParams: apiCalling.fetchNews(
            countryCode: countryCode,
            category: "technology",
          ),
        ),
      ),
    );
  }
}

class CountryCategoryEntertainment extends StatelessWidget {
  final String countryCode;

  const CountryCategoryEntertainment({
    Key? key,
    required this.countryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var apiCalling = CountryApiClass();
    return SingleChildScrollView(
      child: ContentBoxWidget(
        futureParams: apiCalling.fetchNews(
          countryCode: countryCode,
          category: "entertainment",
        ),
      ),
    );
  }
}

class CountryCategorySports extends StatelessWidget {
  final String countryCode;

  const CountryCategorySports({
    Key? key,
    required this.countryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var apiCalling = CountryApiClass();
    return Container(
      child: SingleChildScrollView(
        child: ContentBoxWidget(
          futureParams: apiCalling.fetchNews(
            countryCode: countryCode,
            category: "sports",
          ),
        ),
      ),
    );
  }
}

class CountryCategoryScience extends StatelessWidget {
  final String countryCode;

  const CountryCategoryScience({
    Key? key,
    required this.countryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var apiCalling = CountryApiClass();
    return Container(
      child: SingleChildScrollView(
        child: ContentBoxWidget(
          futureParams: apiCalling.fetchNews(
            countryCode: countryCode,
            category: "science",
          ),
        ),
      ),
    );
  }
}

class CountryCategoryHealth extends StatelessWidget {
  final String countryCode;

  const CountryCategoryHealth({
    Key? key,
    required this.countryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var apiCalling = CountryApiClass();
    return Container(
      child: SingleChildScrollView(
        child: ContentBoxWidget(
          futureParams: apiCalling.fetchNews(
            countryCode: countryCode,
            category: "health",
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: unnecessary_null_comparison, dead_code

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:market_news/Presentation/common/custom-text.dart';
import '../models/top_headlines.dart';
import '../../Presentation/screens/Home/pages/TabBar/content_page.dart';

class ApiCalling {
  Future<News> fetchNews({
    bool endpointEverthing = true,
    String qKeyword = '',
    String sources = '',
    String language = '',
    String sortBy = '',
    String from = '',
    String to = '',
    String topHeadlinesQ = '',
    String topHeadlinesCountry = '',
    String topHeadlinesCategory = '',
    String topHeadlinesSource = '',
  }) async {
    final String endpoint = endpointEverthing
        ? 'https://newsapi.org/v2/everything'
        : 'https://newsapi.org/v2/top-headlines';

    // Query parameters for the `everything` endpoint
    final Map<String, String> everythingParams = {
      'q': qKeyword,
      'sources': sources,
      'language': language,
      'sortBy': sortBy,
      'from': from,
      'to': to,
      'apiKey': '5e33c06ec8d94a9e87374c9a5411df9c',
    };

    // Query parameters for the `top-headlines` endpoint
    final Map<String, String> topHeadlinesParams = {
      'q': topHeadlinesQ,
      'sources': topHeadlinesSource,
      'country': topHeadlinesCountry,
      'category': topHeadlinesCategory,
      'apiKey': 'bc6b5bbf69cb4dba92dbf665417fc4af',
    };

    final Map<String, String> params =
        endpointEverthing ? everythingParams : topHeadlinesParams;

    final Uri uri = Uri.parse(endpoint).replace(queryParameters: params);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return News.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }
}

class SearchApiCalling {
  final String baseUrl = 'https://newsapi.org/v2/top-headlines';
  final String apiKey = 'c92127d2cd5b49ea8af99ab62efd8df9';
  Future<News> fetchNews({
    required String? qKeyword,
  }) async {
    final response =
        await http.get(Uri.parse("$baseUrl?q=$qKeyword&apiKey=$apiKey"));
    if (response.statusCode == 200) {
      return News.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }
}

class CountryApiClass {
  final String baseUrl = 'https://newsapi.org/v2/top-headlines';
  final String apiKey = 'e9aea9c1fc0949fa9a67b275d5be1bb8';

  Future<News> fetchNews({
    required String countryCode,
    String? category = '',
  }) async {
    final response = await http.get(Uri.parse(
        '$baseUrl?country=$countryCode&category=$category&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      return News.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }
}

//! Api key 1 5e33c06ec8d94a9e87374c9a5411df9c
//! Api key 2 e9aea9c1fc0949fa9a67b275d5be1bb8
//! Api key 3 bc6b5bbf69cb4dba92dbf665417fc4af

class NavigationUtils {
  static void navigateToNewsContentScreen(
    BuildContext context, {
    bool endpointEverthing = true,
    String qKeyword = '',
    String sources = '',
    String language = '',
    String sortBy = '',
    String from = '',
    String to = '',
    String topHeadlinesQ = '',
    String topHeadlinesCountry = '',
    String topHeadlinesCategory = '',
    String topHeadlinesSource = '',
    required UnderLineText underLineText,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewsContentScreen(
          endpointEverthing: endpointEverthing,
          qKeyword: qKeyword,
          sources: sources,
          language: language,
          sortBy: sortBy,
          from: from,
          to: to,
          topHeadlinesQ: topHeadlinesQ,
          topHeadlinesCountry: topHeadlinesCountry,
          topHeadlinesCategory: topHeadlinesCategory,
          topHeadlinesSource: topHeadlinesSource,
          underLineText: underLineText,
        ),
      ),
    );
  }
}

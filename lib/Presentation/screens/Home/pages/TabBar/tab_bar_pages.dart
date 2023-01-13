import 'package:flutter/material.dart';
import 'package:market_news/Presentation/common/colors.dart';
import 'package:market_news/Presentation/common/custom-text.dart';

import 'tab_bar_common_data.dart';

class INVESTING extends StatelessWidget {
  const INVESTING({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarCommonData(
      category: "investing",
      underLineText: UnderLineText(
          text: "INVESTING",
          fontsize: 20,
          width: 95,
          height: 15,
          paddingVertical: 12,
          underlineColor: mordernBgGreen),
    );
  }
}

class BUSINESS extends StatelessWidget {
  const BUSINESS({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarCommonData(
      category: "business",
      underLineText: UnderLineText(
          text: "BUSINESS",
          fontsize: 20,
          width: 89,
          height: 15,
          paddingVertical: 12,
          underlineColor: mordernBgGreen),
    );
  }
}

class TECH extends StatelessWidget {
  const TECH({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarCommonData(
      category: "technology",
      underLineText: UnderLineText(
          text: "TECH",
          fontsize: 20,
          width: 50,
          height: 15,
          paddingVertical: 12,
          underlineColor: mordernBgGreen),
    );
  }
}

class POLITICS extends StatelessWidget {
  const POLITICS({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarCommonData(
      category: "politics",
      underLineText: UnderLineText(
          text: "POLITICS",
          fontsize: 20,
          width: 83,
          height: 15,
          paddingVertical: 12,
          underlineColor: mordernBgGreen),
    );
  }
}

class SPORTS extends StatelessWidget {
  const SPORTS({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarCommonData(
      category: "sports",
      underLineText: UnderLineText(
          text: "SPORTS",
          fontsize: 20,
          width: 65,
          height: 15,
          paddingVertical: 12,
          underlineColor: mordernBgGreen),
    );
  }
}

class SCIENCE extends StatelessWidget {
  const SCIENCE({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarCommonData(
      category: "science",
      underLineText: UnderLineText(
          text: "SCIENCE",
          fontsize: 20,
          width: 73,
          height: 15,
          paddingVertical: 12,
          underlineColor: mordernBgGreen),
    );
  }
}

class HEALTH extends StatelessWidget {
  const HEALTH({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarCommonData(
      category: "health",
      underLineText: UnderLineText(
          text: "HEALTH",
          fontsize: 20,
          width: 70,
          height: 15,
          paddingVertical: 12,
          underlineColor: mordernBgGreen),
    );
  }
}

class INTERNATIONAL extends StatelessWidget {
  const INTERNATIONAL({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarCommonData(
      category: "international",
      underLineText: UnderLineText(
          text: "INTERNATIONAL",
          fontsize: 20,
          width: 145,
          height: 15,
          paddingVertical: 12,
          underlineColor: mordernBgGreen),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_news/Data/dataproviders/api_testing.dart';
import 'package:market_news/Presentation/common/custom-text.dart';
import 'package:market_news/Presentation/screens/Country/sub_category_pages.dart';
import '../../common/colors.dart';

class HeadlinesFromCountryPage extends StatefulWidget {
  final String? countryCodes;
  final String? countryName;
  const HeadlinesFromCountryPage({
    Key? key,
    required this.countryCodes,
    required this.countryName,
  }) : super(key: key);

  @override
  State<HeadlinesFromCountryPage> createState() =>
      _HeadlinesFromCountryPageState();
}

class _HeadlinesFromCountryPageState extends State<HeadlinesFromCountryPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                icon: const Icon(CupertinoIcons.back),
              ),
              title: CustomText(
                  text: "TOP HEADLINE'S",
                  colors: black,
                  fontsize: 20.sp,
                  fontWeight: FontWeight.w900),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(1.0.h),
                child: Divider(
                  height: 1.0.h,
                  thickness: 1.5.h,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
            body: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      controller: tabController,
                      isScrollable: true,
                      indicatorWeight: 0.01,
                      physics: const BouncingScrollPhysics(),
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                        fontSize: 19.0.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Sequel Sans",
                      ),
                      unselectedLabelColor: Colors.black.withOpacity(0.4),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 17.0.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Sequel Sans",
                      ),
                      tabs: const [
                        Tab(text: "ENTERTAINMENT"),
                        Tab(text: "BUSINESS"),
                        Tab(text: "TECH"),
                        Tab(text: "SPORTS"),
                        Tab(text: "SCIENCE"),
                        Tab(text: "HEALTH"),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Divider(
                      height: 1.0.h,
                      thickness: 2.0.h,
                      color: Colors.black.withOpacity(0.1),
                    ),
                    SizedBox(
                      height: 588.h,
                      child: Column(
                        children: [
                          Expanded(
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                CountryCategoryEntertainment(
                                    countryCode: widget.countryCodes!),
                                CountryCategoryBusiness(
                                    countryCode: widget.countryCodes!),
                                CountryCategoryTechnology(
                                    countryCode: widget.countryCodes!),
                                CountryCategorySports(
                                    countryCode: widget.countryCodes!),
                                CountryCategoryScience(
                                    countryCode: widget.countryCodes!),
                                CountryCategoryHealth(
                                    countryCode: widget.countryCodes!)
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          );
        });
  }
}

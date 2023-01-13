import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_news/Presentation/common/colors.dart';
import 'pages/TabBar/tab_bar_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 8, vsync: this);
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
            backgroundColor: mordernPurple,
            body: SafeArea(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 130.w,
                        height: 30.h,
                        child: Image.asset(
                          "assets/text/news.png",
                        ),
                      ),
                      Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 30.sp,
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 1.0.h,
                  thickness: 2.0.h,
                  color: Colors.black.withOpacity(0.1),
                ),
                SizedBox(height: 5.h),
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
                    Tab(text: "INVESTING"),
                    Tab(text: "BUSINESS"),
                    Tab(text: "TECH"),
                    Tab(text: "POLITICS"),
                    Tab(text: "SPORTS"),
                    Tab(text: "SCIENCE"),
                    Tab(text: "HEALTH"),
                    Tab(text: "INTERNATIONAL"),
                  ],
                ),
                SizedBox(height: 5.h),
                Divider(
                  height: 1.0.h,
                  thickness: 2.0.h,
                  color: Colors.black.withOpacity(0.1),
                ),
                SizedBox(
                  height: 526.6.h,
                  child: Column(
                    children: [
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: const [
                            INVESTING(),
                            BUSINESS(),
                            TECH(),
                            POLITICS(),
                            SPORTS(),
                            SCIENCE(),
                            HEALTH(),
                            INTERNATIONAL()
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
          );
        });
  }
}

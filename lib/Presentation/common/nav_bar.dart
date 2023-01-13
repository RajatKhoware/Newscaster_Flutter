// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_news/Presentation/common/colors.dart';
import 'package:market_news/Presentation/common/custom-text.dart';
import 'package:market_news/Presentation/screens/Country/country_screen.dart';
import 'package:market_news/Presentation/screens/Home/home_page.dart';
import 'package:market_news/Presentation/screens/Info/about_apk.dart';
import 'package:market_news/Presentation/screens/Search/search_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  final List<Color> navBarColors = [
    mordernPurple,
    mordernLightPurple,
    mordernBlue,
    mordernPurple,
  ];

  final screens = [
    const HomePage(),
    const SearchScreen(),
    const CountryScreen(),
    const InfoAboutApk()
  ];
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Scaffold(
            body: screens[selectedIndex],
            bottomNavigationBar: Container(
              height: 80.h,
              color: navBarColors[selectedIndex],
              child: Column(
                children: [
                  Divider(
                    height: 1.0.h,
                    thickness: 2.5.h,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  BottomAppBar(
                      elevation: 0,
                      color: Colors.transparent,
                      child: SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 25.w,
                            right: 25.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconsBottomBar(
                                text: "HOME",
                                icon: Icons.home,
                                selected: selectedIndex == 0,
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 0;
                                  });
                                },
                                leftTextPadding: 0,
                                width: 50.w,
                                height: 10.h,
                              ),
                              IconsBottomBar(
                                text: "SEARCH",
                                icon: CupertinoIcons.search,
                                selected: selectedIndex == 1,
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                },
                                leftTextPadding: 15.w,
                                width: 75.w,
                                height: 10.h,
                              ),
                              IconsBottomBar(
                                text: "COUNTRY",
                                icon: CupertinoIcons.globe,
                                selected: selectedIndex == 2,
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 2;
                                  });
                                },
                                leftTextPadding: 25.w,
                                width: 88.w,
                                height: 10.h,
                              ),
                              IconsBottomBar(
                                text: "INFO",
                                icon: Icons.info_outline,
                                selected: selectedIndex == 3,
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 3;
                                  });
                                },
                                leftTextPadding: 5.w,
                                width: 35.w,
                                height: 10.h,
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          );
        });
  }
}

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({super.key});

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Container(
            // height: 80.h,
            color: mordernPurple,
            child: Column(
              children: [
                Divider(
                  height: 1.0.h,
                  thickness: 2.5.h,
                  color: Colors.black.withOpacity(0.5),
                ),
                BottomAppBar(
                    elevation: 0,
                    color: Colors.transparent,
                    child: SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 25.w,
                          right: 25.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconsBottomBar(
                              text: "HOME",
                              icon: Icons.home,
                              selected: selectedIndex == 0,
                              onPressed: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              },
                              width: 45.w,
                              height: 10.h,
                            ),
                            IconsBottomBar(
                              text: "WATCH",
                              icon: Icons.tv,
                              selected: selectedIndex == 1,
                              onPressed: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                              width: 30.w,
                              height: 10.h,
                            ),
                            IconsBottomBar(
                              text: "READ",
                              icon: Icons.speaker,
                              selected: selectedIndex == 2,
                              onPressed: () {
                                setState(() {
                                  selectedIndex = 2;
                                });
                              },
                              width: 45.w,
                              height: 10.h,
                            ),
                            IconsBottomBar(
                              text: "ACCOUNT",
                              icon: Icons.people,
                              selected: selectedIndex == 3,
                              onPressed: () {
                                setState(() {
                                  selectedIndex = 3;
                                });
                              },
                              width: 45.w,
                              height: 10.h,
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          );
        });
  }
}

class IconsBottomBar extends StatefulWidget {
  final bool selected;
  final IconData icon;
  final String text;
  final double width;
  final double height;
  final double? leftTextPadding;
  final VoidCallback onPressed;

  const IconsBottomBar({
    Key? key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
    required this.width,
    required this.height,
    this.leftTextPadding = 15.0,
  }) : super(key: key);

  @override
  State<IconsBottomBar> createState() => _IconsBottomBarState();
}

class _IconsBottomBarState extends State<IconsBottomBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return SizedBox(
            height: 79.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                      padding: widget.selected
                          ? EdgeInsets.only(
                              top: 10.h, left: widget.leftTextPadding!.w)
                          : EdgeInsets.only(top: 0.h),
                      onPressed: widget.onPressed,
                      icon: Icon(
                        widget.icon,
                        size: widget.selected ? 35.sp : 33.sp,
                        color: widget.selected
                            ? Colors.black
                            : Colors.black.withOpacity(0.6),
                      )),
                ),
                widget.selected
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: UnderLineText(
                            text: widget.text,
                            fontsize: 13.sp,
                            width: widget.width,
                            height: widget.height,
                            paddingVertical: 6,
                            fontFamily: "TS BLOCK",
                            fontWeightt: FontWeight.w400,
                            underlineColor: mordernYellow),
                      )
                    : const SizedBox(),
              ],
            ),
          );
        });
  }
}

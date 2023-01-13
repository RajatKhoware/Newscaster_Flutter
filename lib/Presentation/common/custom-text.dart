// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color colors;
  final double fontsize;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextOverflow? overFlow;
  final String? fontFamily;

  const CustomText({
    Key? key,
    required this.text,
    required this.colors,
    required this.fontsize,
    required this.fontWeight,
    this.maxLines,
    this.overFlow,
    this.fontFamily = "Sequel Sans",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Text(
            text,
            maxLines: maxLines,
            style: TextStyle(
                color: colors,
                fontWeight: fontWeight,
                fontSize: fontsize.sp,
                overflow: overFlow,
                fontFamily: fontFamily),
          );
        });
  }
}

class UnderLineText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double fontsize;
  final FontWeight? fontWeightt;
  final Color? fontColors;
  final double width;
  final double height;
  final Color underlineColor;
  final double? paddingVertical;

  const UnderLineText({
    Key? key,
    required this.text,
    this.fontFamily = "Sequel Sans",
    required this.fontsize,
    this.fontWeightt = FontWeight.w600,
    this.fontColors = Colors.black,
    required this.width,
    required this.height,
    required this.underlineColor,
    this.paddingVertical = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Stack(
              children: [
                Container(
                  width: width.w + 20.w,
                  height: height.h + 10.h,
                  // color: mordernPurple,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: paddingVertical!.w),
                  child: Container(
                    width: width.w,
                    height: height.h,
                    color: underlineColor,
                  ),
                ),
                CustomText(
                    text: text,
                    fontsize: fontsize,
                    fontWeight: fontWeightt!,
                    fontFamily: fontFamily,
                    colors: fontColors!),
              ],
            ),
          );
        });
  }
}

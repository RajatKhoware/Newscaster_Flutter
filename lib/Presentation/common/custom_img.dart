// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FramedImg extends StatelessWidget {
  final double width;
  final double height;
  final String imgUrl;
  final Color? containerColor;
  final double topPadding;
  final double leftPadding;
  const FramedImg({
    Key? key,
    required this.width,
    required this.height,
    required this.imgUrl,
    this.containerColor = Colors.black,
    required this.topPadding,
    required this.leftPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: leftPadding, top: topPadding),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: containerColor!,
                ),
                color: Colors.transparent),
          ),
        ),
        SizedBox(
          width: width,
          height: height,
          child: Image.network(
            imgUrl,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}

class FramedImgAssets extends StatelessWidget {
  final double width;
  final double height;
  final String imgUrl;
  final double topPadding;
  final double leftPadding;
  const FramedImgAssets({
    Key? key,
    required this.width,
    required this.height,
    required this.imgUrl,
    required this.topPadding,
    required this.leftPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: leftPadding, top: topPadding),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
                color: Colors.transparent),
          ),
        ),
        SizedBox(
          width: width,
          height: height,
          child: Image.asset(
            imgUrl,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}

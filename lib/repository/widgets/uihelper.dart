import 'package:flutter/material.dart';

class Uihelper {
  static customImage({
    required String img,
    required double height,
    required double width,
  }) {
    return Image.asset("assets/images/$img", height: height, width: width);
  }

  static customText({
    required String text,
    required Color color,
    required FontWeight fontWeight,
    String? fontfamily,
    required double fontsize,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: fontfamily ?? "regular",
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

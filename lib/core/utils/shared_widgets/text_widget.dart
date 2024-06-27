
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_color/app_colors.dart';





class TextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;

  const TextWidget(
      {super.key,
      required this.text,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.maxLines,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? AppColor.blackColor.withOpacity(.78),
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}

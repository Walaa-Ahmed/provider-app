
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/app_color.dart';
import '../../theme/app_color/app_colors.dart';
import 'text_widget.dart';


class PrimaryButtonWithIcon extends StatelessWidget {
  final double height;
  final double? width;
  final VoidCallback onTap;
  final String title;
  final String ?icon;
  final String ?image;
  final Color? iconColor;
  final Color? titleColor;
  final double horizontalMargin;
  final Color? color;
  final double? colorOpacity;
  final double? fontSize;
  final double? borderRadius;
  final bool isDisabled;
  final bool isCenter;
  final bool hasBorder;
  const PrimaryButtonWithIcon(
      {super.key,
      required this.height,
       this.width,
      required this.onTap,
      required this.title,  this.horizontalMargin = 0,
        this.colorOpacity,
      this.titleColor,
      this.color,
       this.icon,
       this.image,
      this.fontSize,
      this.borderRadius,
      this.iconColor,
      this.isDisabled = false,
      this.isCenter = false,
      this.hasBorder = true,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),

        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: isDisabled
              ? (kPrimaryColor.withOpacity(.7))
              : color ?? kPrimaryColor.withOpacity(colorOpacity??1),
          borderRadius: BorderRadius.circular(borderRadius ?? 20.r),
          border: Border.all(
            color: hasBorder? kPrimaryColor :
            isDisabled ? kPrimaryColor.withOpacity(.7) : color??Colors.white ,
            width: 0.5
          )
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: isCenter? MainAxisAlignment.center:MainAxisAlignment.start,
          children: [
            if(icon!=null)
            SvgPicture.asset(
              icon!,
              width: 20.w,
              height: 20.h,
              fit: BoxFit.fill,
              color: iconColor,
            ),
            if(image!=null)
              Image.asset(
                image!,
                width: 20.w,
                height: 20.h,
                fit: BoxFit.fill,
                color: iconColor,
              ),
            SizedBox(width: 10.w),
            TextWidget(
              text: title,
              fontSize: fontSize ?? 16.sp,
              fontWeight: FontWeight.w400,
              textAlign: isCenter? TextAlign.center:TextAlign.start,
              color: titleColor ?? AppColor.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}

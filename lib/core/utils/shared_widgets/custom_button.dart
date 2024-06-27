

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_color/app_colors.dart';
import 'text_widget.dart';

class CustomButton extends StatelessWidget {
 final double? width;
 final String title;
 final Color ?color;
 final Color ?textColor;
 final VoidCallback onTap;
   CustomButton({Key? key,
  this.width ,required this.onTap,required this.title,this.color,this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: ()=> onTap(),
        child: Container(
          height: 0.06.sh,
          width: width ?? 0.9.sw,
          decoration: BoxDecoration(
            color: color ?? AppColor.primaryColor,
            borderRadius: BorderRadius.circular(10.r)
          ),
          child: Center(
            child: TextWidget(
              text: title,
              color: textColor ?? Colors.white,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}

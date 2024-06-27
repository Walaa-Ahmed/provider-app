
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_color.dart';

class CustomLoading extends StatelessWidget {
  final String? color;
  const CustomLoading({super.key , this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height ,
      width:  MediaQuery.of(context).size.width ,
      color: Colors.white.withOpacity(.4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LoadingAnimationWidget.fallingDot(
              size: 70.h,
              color:
              //color!=null? HexColor(color!) :
              kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

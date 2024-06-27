import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';


class ScreenHeader extends StatelessWidget {
 final String title;
 final bool hasBack;
 final Function()? backTap;
  const ScreenHeader({Key? key, required this.title,  this.hasBack = false, this.backTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(hasBack)
        GestureDetector(
          onTap: (){
            backTap!= null?
                backTap!():
            Navigator.pop(context);
          },
          child: Container(
            //margin: EdgeInsets.only(bottom: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(Icons.arrow_back,size: 18.h,),
          ),
        ),
        if(hasBack)
        const Spacer(flex: 3,),

        Text(title,style: Styles.kBold18,),
        if(hasBack)
       const Spacer(flex: 4,),
      ],
    );
  }
}

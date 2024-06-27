import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BackButtonWidget extends StatelessWidget {
  final bool withBackground;
  final bool isWhite;
  const BackButtonWidget({Key? key,this.withBackground = true,
  this.isWhite = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          // width: 30,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: withBackground ? Colors.white.withOpacity(1) : null,
                borderRadius: BorderRadius.circular(8.r)),
            child: Center(child: Icon(Icons.arrow_back,
            color: isWhite? Colors.white : Colors.black,))),
      ),
    );
  }
}

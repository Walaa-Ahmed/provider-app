import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles.dart';
import 'custom_icon_button.dart';

class SharedAppBar extends StatelessWidget {
  const SharedAppBar(
      {Key? key, required this.titleOfAppBar, required this.borderColor, required this.bgColor})
      : super(key: key);
  final String titleOfAppBar;
  final Color borderColor;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          onTap: () {
           Navigator.pop(context);
          },
          icon: "assets/images/arrow-back.svg",
          iconColor: Colors.black,
          color: bgColor,
          size: 35.r,
          borderColor: borderColor,
        ),
        const Spacer(
          flex: 3,
        ),
        Text(
          titleOfAppBar,
          style: Styles.kBold16,
        ),
        const Spacer(
          flex: 4,
        )
      ],
    );
  }
}

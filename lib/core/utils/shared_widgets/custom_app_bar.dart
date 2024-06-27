import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider_app/core/utils/shared_widgets/screen_header.dart';

import '../../constants/app_color.dart';


class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: .08.sh,
        backgroundColor: kSecondaryColor,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.r),
          ),
        ),
        centerTitle: true,
        title:  ScreenHeader(
          title: title,
        ));
  }
}

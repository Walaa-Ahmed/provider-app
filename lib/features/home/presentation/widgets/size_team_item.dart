import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_color.dart';

class SizeTeamItem extends StatelessWidget {
  const SizeTeamItem({super.key, required this.titleOfSize});
  final String titleOfSize;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: kBackground,
          border: Border.all(
            color: kMediumGrey.withOpacity(.5),
            width: 0.8,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(titleOfSize),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_color.dart';
class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: kBackground,
          border: Border.all(
            color: kMediumGrey.withOpacity(.5),
            width: 0.8,
          ),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.handshake_outlined,size: 35,),
            SizedBox(height: 10.h,),
            const Text("Service name")
          ],
        )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider_app/features/home/presentation/widgets/size_team_item.dart';

import '../../../../core/constants/app_color.dart';

class AccountSetupViewThree extends StatelessWidget {
  const AccountSetupViewThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 18.h,),
        const SizeTeamItem(titleOfSize: "It's just me"),
        SizedBox(height: 18.h,),
        const SizeTeamItem(titleOfSize: "2-5 people"),
        SizedBox(height: 18.h,),
        const SizeTeamItem(titleOfSize: "6-10 people"),
        SizedBox(height: 18.h,),
        const SizeTeamItem(titleOfSize: "11+ people"),
      ],
    );
  }
}

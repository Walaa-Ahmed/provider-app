import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider_app/core/utils/shared_widgets/default_text_field_widget.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/utils/styles.dart';

class AccountSetupViewOne extends StatelessWidget {
  const AccountSetupViewOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Business name",
            style: Styles.kBold14,
          ),
          const DefaultTextFieldWidget(),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Text(
                "Website",
                style: Styles.kBold14,
              ),
              Text(
                "(Optional)",
                style: Styles.kLight14.copyWith(color: kMediumGrey),
              )
            ],
          ),
          const DefaultTextFieldWidget()
        ],
      ),
    );
  }
}

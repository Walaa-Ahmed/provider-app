import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider_app/core/utils/shared_widgets/default_text_field_widget.dart';

import '../../../../core/utils/styles.dart';


class AccountSetupViewFour extends StatelessWidget {
  const AccountSetupViewFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Text("Where's your business located?",style: Styles.kBold14,),
        SizedBox(height: 10.h,),
        DefaultTextFieldWidget(prefixIcon: Icon(Icons.location_on_outlined),),
        Row(children: [
          Checkbox(value: false, onChanged: (val){}),
          const Text("I don't have a business address")
        ],)
      ],
    );
  }
}

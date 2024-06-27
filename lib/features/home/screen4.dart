import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';
import '../../core/utils/method_helper.dart';
import '../../core/utils/shared_widgets/default_button.dart';
import 'complete.dart';

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      //  SizedBox(height: 300,),
        Container(child: Center(child: Text("Screen4")),),
        // Spacer(),
        // DefaultButton(title: "next",function: (){
        //   MethodHelpers.navigateTo(context, const Complete());
        // },font: 25,radius: 25,color: kPrimaryColor,textColor: kSecondaryColor,),
        // SizedBox(height: 20,)
      ],
    );
  }
}

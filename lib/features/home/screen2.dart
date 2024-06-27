import 'package:flutter/material.dart';
import 'package:provider_app/features/home/screen3.dart';

import '../../core/constants/app_color.dart';
import '../../core/utils/method_helper.dart';
import '../../core/utils/shared_widgets/default_button.dart';
class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       // SizedBox(height: 300,),
        Container(child: Center(child: Text("Screen2")),),
        // Spacer(),
        // DefaultButton(title: "next",function: (){
        //   MethodHelpers.navigateTo(context, const Screen3());
        // },font: 25,radius: 25,color: kPrimaryColor,textColor: kSecondaryColor,),
        // SizedBox(height: 20,)
      ],
    );
  }
}
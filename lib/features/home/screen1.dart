import 'package:flutter/material.dart';
import 'package:provider_app/core/constants/app_color.dart';
import 'package:provider_app/core/utils/shared_widgets/default_button.dart';
import 'package:provider_app/features/home/screen2.dart';

import '../../core/utils/method_helper.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       // SizedBox(height: 300,),
        Container(child: Center(child: Text("Screen1")),),
        // Spacer(),
        // DefaultButton(title: "next",function: (){
        //   MethodHelpers.navigateTo(context, const Screen2());
        // },font: 25,radius: 25,color: kPrimaryColor,textColor: kSecondaryColor,),
        // SizedBox(height: 20,)
      ],
    );
  }
}


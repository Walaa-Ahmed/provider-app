import 'package:flutter/material.dart';
import 'package:provider_app/features/home/screen4.dart';

import '../../core/constants/app_color.dart';
import '../../core/utils/method_helper.dart';
import '../../core/utils/shared_widgets/default_button.dart';
class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       // SizedBox(height: 300,),
        Container(child: Center(child: Text("Screen3")),),
        // Spacer(),
        // DefaultButton(title: "next",function: (){
        //   MethodHelpers.navigateTo(context, const Screen4());
        // },font: 25,radius: 25,color: kPrimaryColor,textColor: kSecondaryColor,),
        // SizedBox(height: 20,)
      ],
    );
  }
}


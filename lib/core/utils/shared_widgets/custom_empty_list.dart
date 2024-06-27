import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart'as lottie;

import '../../constants/app_color.dart';
import '../styles.dart';


class CustomEmptyList extends StatelessWidget {
  const CustomEmptyList({
  super.key,
  required this.title,
   this.lottieFile,
  });

  final String title;
  final String ?lottieFile;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: 75,),
        lottie.Lottie.asset( lottieFile ?? "assets/images/empty.json"
        ,height: size.height * .3,fit: BoxFit.fill),
     //   Image.asset("assets/images/empty.json",height: size.height * .3,fit: BoxFit.fill,),
        const SizedBox(height: 24,),
        Text(
            title,
            style:Styles.kMedium16.copyWith(color: kTextColor)),

      ],
    );
  }
}
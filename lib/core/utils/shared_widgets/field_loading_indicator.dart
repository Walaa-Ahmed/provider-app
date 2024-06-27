
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class FieldLoadingIndicatorWidget extends StatelessWidget {
  const FieldLoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        size: 30,
        color: kPrimaryColor,
      ),
    );
  }
}

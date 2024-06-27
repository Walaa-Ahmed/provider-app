
import 'package:flutter/material.dart';

import '../../theme/app_color/app_colors.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColor.primaryColor,
        color: AppColor.primaryColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider_app/core/constants/app_color.dart';
import 'package:provider_app/features/home/presentation/widgets/service_item.dart';

class AccountSetupViewTwo extends StatelessWidget {
  const AccountSetupViewTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 18.0,
      crossAxisSpacing: 18.0,
      padding: const EdgeInsets.all(10.0),
      children: List.generate(9, (index) {
        return const ServiceItem();
      }),
    );
  }
}
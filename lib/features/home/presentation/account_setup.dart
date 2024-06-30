import 'package:flutter/material.dart';
import 'package:provider_app/features/home/presentation/widgets/account_setup_body.dart';
import '../../../core/constants/app_color.dart';

class AccountSetup extends StatelessWidget {
   AccountSetup({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: kBackground,
        body: AccountSetupBody()
      ),
    );
  }
}

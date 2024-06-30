import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider_app/core/utils/styles.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/utils/method_helper.dart';
import '../../../../core/utils/shared_widgets/default_button.dart';
import '../complete.dart';
import 'account_setup_view_four.dart';
import 'account_setup_view_one.dart';
import 'account_setup_view_three.dart';
import 'account_setup_view_two.dart';

class AccountSetupBody extends StatefulWidget {
  const AccountSetupBody({super.key});

  @override
  State<AccountSetupBody> createState() => _AccountSetupBodyState();
}

class _AccountSetupBodyState extends State<AccountSetupBody> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.h,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                width: 10.w,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex=index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: index <= selectedIndex ? kPrimaryColor : kLightGrey,
                    ),
                    width: 80.w,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedIndex == 0
                    ? const SizedBox()
                    : const Icon(Icons.arrow_back),
                InkWell(onTap: () {}, child: const Text("Logout"))
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          const Text("Account Setup"),
          SizedBox(
            height: 20.h,
          ),
          Text(selectedIndex == 0 ? "What's your business name?": selectedIndex == 1 ? "What services do you offer?" : selectedIndex ==2 ? "What's your team size?": "Set your location",style: Styles.kBold20,),
          SizedBox(
            height: 20.h,
          ),
          Text(selectedIndex == 0 ? " This is the brand name your clients will see.": selectedIndex == 1 ? "Choose your primary and up to 3 related service types." : selectedIndex ==2 ? "This will help us set up your calender correctly.": "Add your business location.",style: Styles.kLight14.copyWith(color: kMediumGrey),),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Container(
                child: selectedIndex == 0
                    ? const AccountSetupViewOne()
                    : selectedIndex == 1
                        ? const AccountSetupViewTwo()
                        : selectedIndex == 2
                            ? const AccountSetupViewThree()
                            : const AccountSetupViewFour()),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: DefaultButton(
              title: "Continue",
              function: () {
                setState(() {
                  selectedIndex < 3
                      ? selectedIndex++
                      : MethodHelpers.navigateTo(context, const Complete());
                });
              },
              font: 20,
              radius: 25,
              color: kPrimaryColor,
              textColor: kSecondaryColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

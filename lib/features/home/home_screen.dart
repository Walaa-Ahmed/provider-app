import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider_app/features/home/complete.dart';
import 'package:provider_app/features/home/screen1.dart';
import 'package:provider_app/features/home/screen2.dart';
import 'package:provider_app/features/home/screen3.dart';
import 'package:provider_app/features/home/screen4.dart';
import '../../core/constants/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackground,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: index <= selectedIndex
                              ? kPrimaryColor
                              : kLightGrey,
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
              Expanded(
                child: Container(
                  child: selectedIndex == 0
                      ? Screen1()
                      : selectedIndex == 1
                          ? Screen2()
                          : selectedIndex == 2
                              ? Screen3()
                              : selectedIndex == 3
                                  ? Screen4()
                                  : Complete(),
                ),
              ),
              // Center(
              //   child: DefaultButton(
              //     title: "next",
              //     function: () {
              //       setState(() {
              //         selectedIndex;
              //       });
              //     },
              //     font: 25,
              //     radius: 25,
              //     color: kPrimaryColor,
              //     textColor: kSecondaryColor,
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

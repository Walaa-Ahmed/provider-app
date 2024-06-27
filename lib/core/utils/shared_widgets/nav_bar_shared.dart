import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTab = 0;

  List<TabItem> items = [
    const TabItem(
      icon: Icons.home,
      title: 'Home',
    ),
    const TabItem(
      icon: Icons.notifications,
      title: 'Notification',
    ),
    const TabItem(
      icon: Icons.calendar_today_rounded,
      title: 'Booking',
    ),
    const TabItem(
      icon: Icons.favorite,
      title: 'Saved',
    ),
    const TabItem(
      icon: Icons.account_box,
      title: 'profile',
    ),
  ];

  List<Widget> screens = [
    // const HomeView(),
    // const NotificationView(),
    // const BookingView(),
    // const SavedView(),
    // const SideMenuView()
    Container(
      child: Center(
        child: Text("Tab"),
      ),
    ),
    Container(
      child: Center(
        child: Text("Tab"),
      ),
    ),
    Container(
      child: Center(
        child: Text("Tab"),
      ),
    ),
    Container(
      child: Center(
        child: Text("Tab"),
      ),
    ),
    Container(
      child: Center(
        child: Text("Tab"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentTab],
      bottomNavigationBar: BottomBarFloating(
        items: items,
        backgroundColor: Colors.white,
        color: Colors.grey,
        colorSelected: kPrimaryColor,
        indexSelected: currentTab,
        paddingVertical: 8,
        onTap: (int index) => setState(() {
          currentTab = index;
        }),
      ),
    );
  }
}

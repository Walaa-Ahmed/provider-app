import 'package:url_launcher/url_launcher.dart';

//import 'package:intl/intl.dart';


import 'package:flutter/material.dart' hide ModalBottomSheetRoute;


class MethodHelpers {
  const MethodHelpers._();

  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getSizeInSaveArea(BuildContext context) {
    var totalHeight = MediaQuery.of(context).size.height;
    var paddingHeight = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;

    return totalHeight - paddingHeight;
  }

  static double getMobileNavigationBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double getMobileStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static Future navigateTo(BuildContext context, createPage) async {
    Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) => createPage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
    // return await Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (BuildContext context) {
    //   return createPage;
    // }));
  }

  static pushAnimated(BuildContext context, Widget destination) {
    Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }

  static Future navigateAndRemoveUntil(BuildContext context, createPage) async {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (ctx) => createPage,
      ),
      (route) => false,
    );
  }

  static Future navigateToWithRemovingBottomBar(
      BuildContext context, createPage) async {
    return await Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return createPage;
        },
      ),
    );
  }

  static Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }



  static String? validation(p0) {
    if (p0 == '') {
      return 'This Field is Required';
    }
    return null;
  }

  static void deleteLocally({
    required int index,
    required List selectedList,
  }) {
    selectedList.removeAt(index);
  }

  static openWebView(String url) async {
    var uri = Uri.parse(url);
    // if (await canLaunchUrl(
    //   uri,
    // )) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
  //  }
  }



  // static parseTime(String time) {
  //   try {
  //     return DateFormat.yMd()
  //         .add_jm()
  //         .format(DateFormat("yyyyy.MMMM.dd GGG hh:mm aaa").parse(time));
  //   } catch (e) {
  //     return formatTime(time);
  //   }
  // }

  static formatTime(String time) {
    if (time.length > 5) {
      try {
        int hours = int.parse(time.substring(0, 2));
        if (hours > 12) {
          hours = hours - 12;
          time = '${time.substring(0, 5)} PM';
        } else {
          time = '${time.substring(0, 5)} AM';
        }
        if (hours < 9) {
          return time.replaceRange(0, 2, '0$hours');
        } else {
          return time.replaceRange(0, 2, '$hours');
        }
      } catch (e) {
        return time.substring(0, 5);
      }
    }
  }

  static String checkCurrentTimeZone(String time) {
    if (time.length > 11) {
      String year = time.substring(0, 4);
      String month = time.substring(5, 7);
      String day = time.substring(8, 10);
      String hour = time.substring(11, 13);
      String minute = time.substring(14, 16);
      bool orderPeriodIsEvening =
          time.substring(9, 11).toLowerCase() == 'pm' && !time.contains('12');
      hour = orderPeriodIsEvening ? (int.parse(hour) + 12).toString() : hour;
      Duration currentTimeZone = DateTime.now().timeZoneOffset;
      int actualTime = int.parse(hour) + currentTimeZone.inHours;
      return '$day-$month-$year  $actualTime:$minute';
    } else {
      return time;
    }
  }



}

// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:lottie/lottie.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pharmacy/core/constants/app_color.dart';
// import 'package:badges/badges.dart' as badges;
// import 'package:pharmacy/features/account_menu/presentation/account_menu.dart';
// import 'package:pharmacy/features/all_categories/presentation/all_categories_screen.dart';
// import 'package:pharmacy/features/home/provider/home_provider.dart';
// import '../core/utils/styles.dart';
// import '../features/cart/presentation/cart_view.dart';
// import '../features/cart/provider/cart_provider.dart';
// import '../features/chat_support/presentation/chat_support_view.dart';
// import '../features/home/presentation/home_screen.dart';
// import 'package:provider/provider.dart';
//
// class BottomNavBar extends StatefulWidget {
//   final int? index;
//   // int? status;
//   BottomNavBar({this.index});
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   int? currentTab = 0;
//   bool isLogin = false;
//   DateTime? currentBackPressTime;
//   String notification = '0';
//
//   int status = 0;
//
//   bool connected = true;
//   checkConnection() async {
//     bool result = await InternetConnectionChecker().hasConnection;
//
//     if (result == true) {
//       setState(() {
//         connected = true;
//       });
//     } else {
//       setState(() {
//         connected = false;
//       });
//     }
//   }
//
//   switchScreens(int index) {
//     List<Widget> screens = [
//       HomeView(),
//       AllCategoriesScreen(),
//       CartView(
//         isFromHome: true,
//       ),
//       ChatSupportView(),
//       AccountMenuView(),
//     ];
//
//     return screens[index];
//   }
//
//   @override
//   void initState() {
//     currentTab = widget.index ?? 0;
//     // Timer.periodic(Duration(seconds: 3),(t){
//     checkConnection();
//
//     // });
//     super.initState();
//   }
//
//   Future<bool> onWillPop() {
//     if (currentTab != 0) {
//       setState(() {
//         currentTab = 0;
//       });
//       return Future.value(false);
//     }
//     else if(currentTab == 0 && HomeProvider.get(context).filteredProducts.isEmpty){
//       DateTime now = DateTime.now();
//       if (currentBackPressTime == null ||
//           now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
//         currentBackPressTime = now;
//         Fluttertoast.showToast(msg: 'Double Tap To Exit');
//         return Future.value(false);
//       } else
//         exit(0);
//     }
//     else{
//       return Future.value(true);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return WillPopScope(
//       onWillPop: onWillPop,
//       child: Scaffold(
//         body: Stack(
//           children: [
//             // _screens[currentTab!],
//             if (connected) switchScreens(currentTab!),
//
//             if (!connected)
//               Container(
//                 height: size.height,
//                 width: size.width,
//                 child: Center(
//                   child: Lottie.asset('assets/images/no_signal.json'),
//                 ),
//               ),
//
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 height: 50,
//                 width: 1.sw,
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12.r),
//                     boxShadow: [
//                       // BoxShadow(
//                       //     offset: Offset(1, 1),
//                       //     color: Colors.grey[200]!,
//                       //     blurRadius: 1,
//                       //     spreadRadius: 1),
//                       // BoxShadow(
//                       //     offset: Offset(-1, -1),
//                       //     color: Colors.grey[200]!,
//                       //     blurRadius: 1,
//                       //     spreadRadius: 1)
//                     ]),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 0.w,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           currentTab = 0;
//                         });
//                       },
//                       child: Image.asset('assets/images/logo_pharmacy.png',
//                           height: 25,
//                           //width: 50,
//                           color: currentTab != 0 ? Colors.grey[400] : null),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           currentTab = 1;
//                         });
//                       },
//                       child: Image.asset('assets/images/categories.png',
//                           height: 25,
//                         //  width: 50,
//                           color: currentTab == 1
//                               ? kPrimaryColor
//                               : Colors.grey[400]),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           currentTab = 2;
//                         });
//                       },
//                       child: Container(
//                        // width: 50,
//                         height: 30,
//                         child: Consumer<CartProvider>(
//                             builder: (context, cartProvider, _) {
//                               return Directionality(
//                                 textDirection: TextDirection.ltr,
//                                 child: badges.Badge(
//                                   badgeContent:  Text(
//                                     cartProvider.cartProducts.length.toString(),
//                                     style: Styles.kMedium12.copyWith(
//                                         color: Colors.white, fontSize: 10.sp),
//                                   ),
//                                   position: badges.BadgePosition.topEnd(top: -10,
//                                       end: -10),
//                                   child: Image.asset('assets/images/cart.png',
//                                           height: 27,
//                                          // width: 50,
//                                           color: currentTab == 2
//                                               ? kPrimaryColor
//                                               : Colors.grey[400]),
//                                 ),
//                               );
//
//                           // return Stack(
//                           //   alignment: Alignment.bottomCenter,
//                           //   // mainAxisAlignment: MainAxisAlignment.center,
//                           //   // crossAxisAlignment: CrossAxisAlignment.start,
//                           //   children: [
//                           //     //   Icon(Icons.circle,color: Colors.red,size: 10,),
//                           //     Image.asset('assets/images/cart.png',
//                           //         height: 32,
//                           //         width: 50,
//                           //         color: currentTab == 2
//                           //             ? kPrimaryColor
//                           //             : Colors.grey[400]),
//                           //     Positioned(
//                           //       top: 0,
//                           //       right: 0,
//                           //       width: 20,
//                           //       child: Container(
//                           //         width: 20,
//                           //         decoration: BoxDecoration(
//                           //             shape: BoxShape.circle,
//                           //             color: Colors.red),
//                           //         child: Center(
//                           //             child: Text(
//                           //           cartProvider.cartProducts.length.toString(),
//                           //           style: Styles.kMedium12.copyWith(
//                           //               color: Colors.white, fontSize: 10.sp),
//                           //         )),
//                           //       ),
//                           //     ),
//                           //   ],
//                           // );
//                         }),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           currentTab = 3;
//                         });
//                       },
//                       child: Image.asset('assets/images/whatsapp2.png',
//                           height: 25,
//                          // width: 50,
//                           color: currentTab == 3
//                               ? kPrimaryColor
//                               : Colors.grey[400]),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           currentTab = 4;
//                         });
//                       },
//                       child: SvgPicture.asset('assets/images/account.svg',
//                           height: 25,
//                          // width: 50,
//                           color: currentTab == 4
//                               ? kPrimaryColor
//                               : Colors.grey[400]),
//                     ),
//                     SizedBox(
//                       width: 5.w,
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class AnimatedCircle extends StatelessWidget {
//   final Widget child;
//   final bool right;
//   AnimatedCircle({required this.child, this.right = false});
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 70,
//       // height: 60,
//       child: Stack(
//         children: [
//           child,
//         ],
//       ),
//     );
//   }
// }

// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:pharmacy/core/utils/dialogs_and_popups.dart';
// import 'package:pharmacy/core/utils/method_helper.dart';
// import 'package:pharmacy/features/notification/presentation/notification_view.dart';
// import 'package:pharmacy/features/orders/presentation/rate_order.dart';
// import 'package:provider/provider.dart';
//
// import '../../features/order_details/order_details_screen.dart';
// import '../../features/orders/provider/orders_provider.dart';
// import '../../features/prescription_order/presentation/requests_screen.dart';
// import '../../features/prescription_order/provider/prescription_provider.dart';
// import '../../shared_widgets/nav_bar.dart';
// import '../constants/navigator_context.dart';
//
// class NotificationService {
//   static String fcmToken = '';
//
//   static initializeAwesomeNotifications() {
//     AwesomeNotifications().initialize(
//       'resource://mipmap/ic_launcher',
//       [
//         NotificationChannel(
//           channelGroupKey: 'basic_channel_group',
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Notification channel for basic tests',
//           ledColor: Colors.white,
//         )
//       ],
//       channelGroups: [
//         NotificationChannelGroup(
//             channelGroupKey: 'basic_channel_group',
//             channelGroupName: 'Basic group')
//       ],
//       // debug: true
//     );
//   }
//
//   static Future<void> firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     if (message.data['type'].toString() == '1') {
//       navigateTo(message.data['order_id'], rate: false);
//     } else if (message.data['type'].toString() == '2') {
//       navigateTo(message.data['order_id'], rate: true);
//     }  else if (message.data['type'].toString() == '3') {
//       navigateTo(message.data['order_id'], isPrescription: true);
//     }
//     else {
//       NavigationService.navigatorKey.currentState!.pushReplacement(
//           MaterialPageRoute(builder: (context) => NotificationView()));
//     }
//   }
//
//   static fcmNotification() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     messaging.getToken().then((token) {
//       fcmToken = token ?? '';
//     });
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     await messaging.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print(message.data.toString() + 'dlkdkd');
//       RemoteNotification notification = message.notification!;
//       AwesomeNotifications().createNotification(
//           content: message.data['image'] != null
//               ? NotificationContent(
//                   id: 10,
//                   channelKey: 'basic_channel',
//                   title: notification.title,
//                   body: notification.body ?? ' ',
//                   icon: 'resource://mipmap/ic_launcher',
//                   bigPicture: message.data['image'],
//                   notificationLayout: NotificationLayout.BigPicture,
//                   roundedLargeIcon: true,
//                   color: Colors.white)
//               : NotificationContent(
//                   id: 10,
//                   channelKey: 'basic_channel',
//                   title: notification.title,
//                   body: notification.body ?? ' ',
//                   icon: 'resource://mipmap/ic_launcher',
//                   roundedLargeIcon: true,
//                 ));
//       DialogsAndPopUp.previewToast(
//           msg: '${notification.title}\n${notification.body}',
//           context: NavigationService.navigatorKey.currentContext!,
//           onTap: () {
//             if (message.data['type'].toString() == '1') {
//               navigateTo(message.data['order_id'], rate: false);
//             } else if (message.data['type'].toString() == '2') {
//               navigateTo(message.data['order_id'], rate: true);
//             }
//             else if (message.data['type'].toString() == '3') {
//               navigateTo(message.data['order_id'], isPrescription: true);
//             }  else {
//               navigateTo(message.data['order_id']);
//             }
//           });
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       if (message.data['type'].toString() == '1') {
//         navigateTo(message.data['order_id'], rate: false);
//       } else if (message.data['type'].toString() == '2') {
//         navigateTo(message.data['order_id'], rate: true);
//       }   else if (message.data['type'].toString() == '3') {
//         navigateTo(message.data['order_id'], isPrescription: true);
//       }
//       else {
//         navigateTo(message.data['order_id']);
//
//       }
//     });
//   }
//
//   static navigateTo(String? orderId, {bool rate = false ,bool isPrescription = false}) {
//     MethodHelpers.navigateTo(
//         NavigationService.navigatorKey.currentContext!,
//         ChangeNotifierProvider(
//             create: (_) => OrdersProvider(),
//             child: rate && orderId!=null
//                 ? RateOrder(
//                     orderId: int.parse(orderId),
//                   ):
//             isPrescription?
//             ChangeNotifierProvider(
//                 create: (context) => PrescriptionProvider(),child: const RequestsScreen())
//                 :orderId != null?
//             OrderDetailsScreen(
//                     orderId: int.parse(orderId),
//                   ):
//         const NotificationView()
//         ));
//   }
// }

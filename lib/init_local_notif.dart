// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:logger/web.dart';

// Future<void> initLocalNotif() async {
//   DarwinInitializationSettings iosInitializationSettings =
//       DarwinInitializationSettings(
//           onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//   AndroidInitializationSettings androidInitializationSettings =
//       AndroidInitializationSettings('@mipmap/ic_launcher');

//   InitializationSettings initializationSettings = InitializationSettings(
//       android: androidInitializationSettings, iOS: iosInitializationSettings);
//   FlutterLocalNotificationsPlugin notificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   await notificationsPlugin.initialize(initializationSettings,
//       onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
// }

// void onDidReceiveLocalNotification(
//     int id, String? title, String? body, String? payload) async {
//   // display a dialog with the notification details, tap ok to go to another page
//   Get.dialog(
//     CupertinoAlertDialog(
//       title: Text(title ?? ''),
//       content: Text(body ?? ''),
//       actions: [
//         CupertinoDialogAction(
//           isDefaultAction: true,
//           child: Text('Ok'),
//           onPressed: () async {},
//         )
//       ],
//     ),
//   );
// }

// showNotif() async {
//   await FlutterLocalNotificationsPlugin().show(
//       1,
//       'Timer app',
//       'Timer is Running',
//       payload: "HAHAHAHAHHAHAHA",
//       NotificationDetails(
//           android: AndroidNotificationDetails('1', "Timer Notifications")));
// }

// void onDidReceiveNotificationResponse(
//     NotificationResponse notificationResponse) {
//   Logger().e("jsonEncode(notificationResponse)");
// }

// localNotifStream() async {
//   StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
//       StreamController<ReceivedNotification>.broadcast();
//   await didReceiveLocalNotificationStream
//     ..add(ReceivedNotification(
//         id: 1, title: "hahah", body: "body", payload: "payload"));
//   await didReceiveLocalNotificationStream.stream
//       .listen((ReceivedNotification event) async {
//     Get.dialog(
//       CupertinoAlertDialog(
//         title: Text(event.title ?? ''),
//         content: Text(event.body ?? ''),
//         actions: [
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             child: Text('Ok'),
//             onPressed: () async {},
//           )
//         ],
//       ),
//     );
//   });
// }

// class ReceivedNotification {
//   ReceivedNotification({
//     required this.id,
//     required this.title,
//     required this.body,
//     required this.payload,
//   });

//   final int id;
//   final String? title;
//   final String? body;
//   final String? payload;
// }

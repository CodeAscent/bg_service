import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bg_service/getx_time.dart';
import 'package:bg_service/init_awesome_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/web.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initListeners();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.detached:
        Logger().f("detached");

      case AppLifecycleState.inactive:
        Logger().f("inactive");
      case AppLifecycleState.paused:
        Logger().f("paused");
        createNotifications();
      case AppLifecycleState.resumed:
        Logger().f("resumed");
        break;
      default:
    }
  }

  final timerController = Get.find<GetxTime>();
  createNotifications() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 10,
      channelKey: 'basic_key',
      autoDismissible: false,
      actionType: ActionType.Default,
      title: 'Hello World!',
      largeIcon:
          "https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/174C605829DEB3C79C2F6993EFA97B2ECBF21D6A152E6BB0CA00DDA987E94BAC/scale?width=1200&aspectRatio=1.78&format=jpeg",
      body: 'This is my first notification! ' + timerController.time.toString(),
    ));
    timerController.initTimer();
  }

  String text = 'Stop';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                createNotifications();
              },
              child: Text("Send Notification"),
            ),
            ElevatedButton(
              onPressed: () async {
                timerController.cancelTimer();
              },
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}

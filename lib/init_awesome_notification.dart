import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';

initAwesome() {
  List<NotificationChannel> channels = [
    NotificationChannel(
        channelKey: 'basic_key',
        channelGroupKey: 'group_key',
        channelName: 'my channel',
        channelDescription: 'This is my channel',
        defaultColor: Colors.green,
        ledColor: Colors.green.shade800),
  ];
  List<NotificationChannelGroup> channelGroups = [
    NotificationChannelGroup(
      channelGroupKey: 'group_key',
      channelGroupName: 'basic group',
    )
  ];
  AwesomeNotifications()
      .initialize(null, channels, channelGroups: channelGroups, debug: true);
}

initListeners() {
  AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onActionReceivedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod);
}

class NotificationController {
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    Logger().w(receivedAction.toString());
  }

  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    Logger().w(receivedAction.toString());
  }

  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    Logger().w(receivedNotification.toString());
  }

  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    Logger().w(receivedNotification.toString());
  }
}

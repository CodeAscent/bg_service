import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

class GetxTime extends GetxController {
  int time = 0;
  late Timer timer;
  initTimer() {
    time = 0;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      time += 1;
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        id: 10,
        channelKey: 'basic_key',
        autoDismissible: false,
        actionType: ActionType.SilentBackgroundAction,
        
        title: 'Hello World!',
        largeIcon:
            "https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/174C605829DEB3C79C2F6993EFA97B2ECBF21D6A152E6BB0CA00DDA987E94BAC/scale?width=1200&aspectRatio=1.78&format=jpeg",
        body: 'This is my first notification! ' + time.toString(),
      ));
      update();
    });
  }

  cancelTimer() {
    timer.cancel();
    update();
  }
}

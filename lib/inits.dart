// import 'dart:async';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_background_service_android/flutter_background_service_android.dart';

// Future<void> initService() async {
//   FlutterBackgroundService service = FlutterBackgroundService();
//   await service.configure(
//       iosConfiguration: IosConfiguration(
//           onForeground: onStart,
//           onBackground: onIonBackground,
//           autoStart: true),
//       androidConfiguration: AndroidConfiguration(
//           onStart: onStart, isForegroundMode: true, autoStart: true));
// }

// @pragma('vm:entry-point')
// Future onStart(ServiceInstance service) async {
//   DartPluginRegistrant.ensureInitialized();
//   if (service is AndroidServiceInstance) {
//     service.on('setAsForeground').listen((event) {
//       service.setAsForegroundService();
//     });
//     service.on('setAsBackground').listen((event) {
//       service.setAsBackgroundService();
//     });
//   }
//   service.on('stop').listen((event) {
//     service.stopSelf();
//   });
//   Timer.periodic(Duration(seconds: 1), (timer) async {
//     if (service is AndroidServiceInstance) {
//       if (await service.isForegroundService()) {}
//     }
//     service.invoke('update');
//   });
// }

// Future<bool> onIonBackground(ServiceInstance service) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DartPluginRegistrant.ensureInitialized();
//   return true;
// }

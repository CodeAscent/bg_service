import 'package:bg_service/getx_time.dart';
import 'package:bg_service/home_screen.dart';
import 'package:bg_service/init_awesome_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initService();
  // await initLocalNotif();
  await initAwesome();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetxTime());
    return GetMaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
      )),
      home: HomeScreen(),
    );
  }
}

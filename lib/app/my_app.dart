import 'package:api_challenge/main.dart';
import 'package:api_challenge/ui/views/api_challenge/home_challenge/home_chllenge.dart';
import 'package:api_challenge/ui/views/main_view/main_view.dart';
import 'package:api_challenge/ui/views/main_view/product_view/product_view.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: MainView(),
    );
  }
}

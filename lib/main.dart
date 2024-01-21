import 'package:api_challenge/app/my_app.dart';
import 'package:api_challenge/core/data/services/cart_service.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs; //top level varaibls
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  Get.put(CartService());
  runApp(const MyApp());
}

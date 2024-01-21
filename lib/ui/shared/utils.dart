import 'package:api_challenge/core/data/repository/shared_prefrence_repository.dart';
import 'package:api_challenge/core/data/services/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isValidPassword(String password) {
  return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(password);
}

Future<XFile?> chooseImage(ImageSource imageSource) async {
  return await ImagePicker().pickImage(source: imageSource);
}

double screenWidth(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.width / percent;
  else
    return Get.size.height / percent;
}

// SharedPrefrenceRepository get storege => Get.find<SharedPrefrenceRepository>();
// //PostRepository get post => Get.find<PostRepository>();

CartService get cartService => Get.find<CartService>();

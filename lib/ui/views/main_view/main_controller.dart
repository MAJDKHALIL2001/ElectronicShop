import 'package:api_challenge/ui/views/main_view/main_view_wigdets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  PageController pagercontroller = PageController(initialPage: 1);
  var selectedView = BottomNavigationEnum.CATEGORIES.obs;

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    // togglemainTap(BottomNavigationEnum.CATEGORIES, 1);
    // pagercontroller.jumpToPage(1);
    // intialView();
    super.onInit();
  }

  void toggleAllproduct() {
    selectedView.value = BottomNavigationEnum.PRODUCT;
    pagercontroller.jumpToPage(0);
  }

  // void intialView() {
  //   selectedView.value = BottomNavigationEnum.CATEGORIES;
  //   pagercontroller.jumpToPage(1);
  // }

  void togglemainTap(BottomNavigationEnum selecteEnum, int index) {
    selectedView.value = selecteEnum;
    pagercontroller.jumpToPage(index);
  }
}

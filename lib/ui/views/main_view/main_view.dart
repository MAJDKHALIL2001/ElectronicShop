import 'package:api_challenge/ui/views/main_view/product_view/product_view.dart';
import 'package:api_challenge/ui/views/main_view/main_controller.dart';
import 'package:api_challenge/ui/views/main_view/main_view_wigdets/bottom_navigation_bar.dart';
import 'package:api_challenge/ui/views/main_view/categories_view/categories_view.dart';
import 'package:api_challenge/ui/views/main_view/cart_view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainController mcontroller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: mcontroller.scaffoldkey,
      body: PageView(
          controller: mcontroller.pagercontroller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ProductView(
                // openDrawer: () {
                //   scaffoldkey.currentState!.openDrawer();
                // },
                ),
            // FavoriteView(),

            CategoriesView(),
            CartView(),
          ]),
      bottomNavigationBar: Obx(() => CustomNavigationBar(
            selected: mcontroller.selectedView.value,
            mainTap: (selecteEnum, index) {
              mcontroller.togglemainTap(selecteEnum, index);
            },
          )),
    ));
  }
}

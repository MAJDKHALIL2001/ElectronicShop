import 'package:api_challenge/ui/shared/colors.dart';
import 'package:api_challenge/ui/shared/utils.dart';
import 'package:api_challenge/ui/views/main_view/main_view_wigdets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BottomNavigationEnum {
  PRODUCT,
  CATEGORIES,
  SETTINGS,
}

class CustomNavigationBar extends StatelessWidget {
  final BottomNavigationEnum selected;

  final Function(BottomNavigationEnum, int) mainTap;
  const CustomNavigationBar(
      {super.key, required this.selected, required this.mainTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greyColor,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        NavItem(
          icon: Icons.shop_2,
          isSelected: selected == BottomNavigationEnum.PRODUCT,
          ontap: () {
            mainTap(BottomNavigationEnum.PRODUCT, 0);
          },
        ),
        NavItem(
            icon: Icons.home,
            isSelected: selected == BottomNavigationEnum.CATEGORIES,
            ontap: () {
              mainTap(BottomNavigationEnum.CATEGORIES, 1);
            }),
        // Obx(() {
        // return
        Stack(
          children: [
            NavItem(
                icon: Icons.card_travel_rounded,
                isSelected: selected == BottomNavigationEnum.SETTINGS,
                ontap: () {
                  mainTap(BottomNavigationEnum.SETTINGS, 2);
                }),
            Obx(() {
              return Container(
                width: 20,
                height: 20,
                color: Colors.red,
                child: Text(
                    style: TextStyle(color: AppColors.white),
                    "${cartService.cartCount}"),
              );
            }),
          ],
        ),
        // }),
      ]),
    );
  }
}

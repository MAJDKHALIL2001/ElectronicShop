import 'package:api_challenge/ui/shared/colors.dart';
import 'package:api_challenge/ui/shared/utils.dart';
import 'package:api_challenge/ui/views/main_view/main_controller.dart';
import 'package:api_challenge/ui/views/main_view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderView extends StatelessWidget {
  OrderView({super.key});
  final MainController mcontroller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsetsDirectional.only(
          start: screenWidth(20), end: screenWidth(20), top: screenWidth(20)),
      child: ListView(
        children: [
          Text(
            "your order placed \n successfuly",
            style: TextStyle(fontSize: screenWidth(10)),
          ),
          Divider(
            color: AppColors.blue400,
            thickness: 2,
          ),
          Obx(() {
            return Row(
              children: [
                Text('Sub total', style: TextStyle(color: AppColors.blue400)),
                Text("${cartService.subTotal}"),
                Spacer(),
                Text("sp"),
              ],
            );
          }),
          Divider(
            color: AppColors.blue400,
            thickness: 2,
          ),
          Obx(() {
            return Row(
              children: [
                Text('Tax', style: TextStyle(color: AppColors.blue400)),
                Text("${cartService.taxAmount}"),
                Spacer(),
                Text("sp"),
              ],
            );
          }),
          Divider(
            color: AppColors.blue400,
            thickness: 2,
          ),
          Obx(() {
            return Row(
              children: [
                Text('deleviery ', style: TextStyle(color: AppColors.blue400)),
                Text("${cartService.deliveryFees.toStringAsFixed(4)}"),
                Spacer(),
                Text("sp"),
              ],
            );
          }),
          Divider(
            color: AppColors.blue400,
            thickness: 2,
          ),
          Obx(() {
            return Row(
              children: [
                Text('Total ', style: TextStyle(color: AppColors.blue400)),
                Text("${cartService.total}"),
                Spacer(),
                Text("sp"),
              ],
            );
          }),
          Divider(
            color: AppColors.blue400,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: screenWidth(1), bottom: screenWidth(30)),
            child: InkWell(
              onTap: () {
                Get.to(MainView());
              },
              child: Container(
                child: Center(
                    child: Text(
                  "Continue shoping",
                  style: TextStyle(color: AppColors.white),
                )),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.blue400,
                ),
                width: double.infinity,
                height: screenWidth(10),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}

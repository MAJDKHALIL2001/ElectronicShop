import 'package:api_challenge/core/data/moduls/cart_model.dart';
import 'package:api_challenge/core/data/repository/shared_prefrence_repository.dart';
import 'package:api_challenge/ui/shared/colors.dart';
import 'package:api_challenge/ui/shared/custom_widgets/custom_text.dart';
import 'package:api_challenge/ui/shared/utils.dart';
import 'package:api_challenge/ui/views/main_view/cart_view/cart_controller.dart';
import 'package:api_challenge/ui/views/order_view/order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  CartView({super.key});
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsDirectional.only(
              start: screenWidth(20),
              end: screenWidth(20),
              top: screenWidth(20)),
          child: ListView(children: [
            Text(
              "CART",
              style: TextStyle(fontSize: screenWidth(10)),
            ),
            Obx(() {
              print(controller.m.value);
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.cartModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                              vertical: screenWidth(20)),
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(25)),
                            child: Row(children: [
                              Image.network(
                                controller.cartModel[index].productModel!.image
                                    .toString(),
                                width: screenWidth(3),
                                height: screenWidth(3),
                              ),
                              // Spacer(),
                              Container(
                                width: screenWidth(1.8),
                                height: screenWidth(3),
                                // color: AppColors.greyColor,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: screenWidth(30)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: InkWell(
                                            onTap: () {
                                              cartService.removeFromCartList(
                                                  controller.cartModel[index]);
                                            },
                                            child: Icon(Icons
                                                .disabled_by_default_rounded),
                                          )),
                                      Text(controller
                                          .cartModel[index].productModel!.title!
                                          .split(' ')
                                          .take(4)
                                          .join(' ')),
                                      Padding(
                                        padding:
                                            EdgeInsetsDirectional.symmetric(
                                                vertical: screenWidth(30)),
                                        child: Row(
                                          children: [
                                            Text(
                                              "price: ",
                                              style: TextStyle(
                                                  color: AppColors.blue400),
                                            ),
                                            Text(
                                              controller.cartModel[index]
                                                  .productModel!.price
                                                  .toString(),
                                              style: TextStyle(
                                                  color: AppColors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text("total: ",
                                              style: TextStyle(
                                                  color: AppColors.blue400)),
                                          Text(
                                            controller.cartModel[index].total
                                                .toString(),
                                            style: TextStyle(
                                                color: AppColors.black),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: screenWidth(3)),
                                        child: Row(children: [
                                          InkWell(
                                              onTap: () {
                                                cartService.changeQty(
                                                    model: controller
                                                        .cartModel[index],
                                                    incress: false);
                                              },
                                              child: Container(
                                                child: Icon(Icons.remove),
                                              )),
                                          Text(
                                              "${controller.cartModel[index].qty}"),

                                          // Text("${controller.qty.value}"),
                                          InkWell(
                                              onTap: () {
                                                cartService.changeQty(
                                                    model: controller
                                                        .cartModel[index],
                                                    incress: true);
                                              },
                                              child: Container(
                                                child: Icon(Icons.add),
                                              )),
                                          // Text("${cartService.cartCount}"),
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
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
                  Text('deleviery ',
                      style: TextStyle(color: AppColors.blue400)),
                  Text("${cartService.deliveryFees.toStringAsFixed(4)}"),
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
                  top: screenWidth(30), bottom: screenWidth(30)),
              child: InkWell(
                onTap: () {
                  Get.off(OrderView());
                },
                child: Container(
                  child: Center(child: Text("Placed Order")),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.blue400,
                  ),
                  width: double.infinity,
                  height: screenWidth(10),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  cartService.clearCart();
                },
                child: Center(child: Text('empty cart'))),
          ]),
        ),
      ),
    );
  }
}

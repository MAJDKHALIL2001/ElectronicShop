import 'package:api_challenge/core/data/moduls/cart_model.dart';
import 'package:api_challenge/core/data/moduls/product_info.dart';
import 'package:api_challenge/ui/shared/colors.dart';
import 'package:api_challenge/ui/shared/utils.dart';
import 'package:api_challenge/ui/views/description_view/description_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class DescriptionView extends StatefulWidget {
  DescriptionView({super.key, required this.infoModel});
  final ProductModel infoModel;

  @override
  State<DescriptionView> createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  final DescriptionController controller = Get.put(DescriptionController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: screenWidth(20)),
            child: Column(children: [
              Padding(
                padding: EdgeInsetsDirectional.only(top: screenWidth(20)),
                child: Text(
                  widget.infoModel.title.toString(),
                  style: TextStyle(fontSize: screenWidth(15)),
                ),
              ),
              Padding(
                padding:
                    EdgeInsetsDirectional.symmetric(vertical: screenWidth(20)),
                child: Center(
                  child: Image.network(
                    widget.infoModel.image.toString(),
                    width: screenWidth(1.86),
                    height: screenWidth(1.86),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "description:",
                    style: TextStyle(fontSize: screenWidth(20)),
                  ),
                  Spacer(),
                  RatingBar.builder(
                    // initialRating: double.parse(controller
                    //         .listproduct[index].rating
                    //         ?.toString() ??
                    //     "0.0"),
                    initialRating: widget.infoModel.rating?.rate ?? 0.0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1),
                    itemSize: 15,

                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
              Container(
                  width: 360,
                  height: 200,
                  child: Text(widget.infoModel.description.toString())),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(20), bottom: screenWidth(20)),
                child: Row(
                  children: [
                    Text("gategory: ",
                        style: TextStyle(color: AppColors.blue400)),
                    Text(
                      widget.infoModel.category.toString(),
                      style: TextStyle(color: AppColors.black),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text("price: ", style: TextStyle(color: AppColors.blue400)),
                  Text(
                    widget.infoModel.price.toString(),
                    style: TextStyle(color: AppColors.black),
                  ),
                ],
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: screenWidth(6)),
            child: Obx(() {
              print(controller.qty);
              return Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.3, color: AppColors.greyColor),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      cartService.addToCart(
                          model: widget.infoModel, qty: controller.qty.value);
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: screenWidth(20), end: screenWidth(7)),
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            color: AppColors.blue400,
                            // border: Border.all(width: 0.3, color: AppColors.greyColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            )),
                        child: Center(child: Text('add to cart')),
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        controller.subtractFromQty();
                      },
                      child: Container(
                        child: Icon(Icons.remove),
                      )),
                  // Text("${cartService.getItemQty(infoModel)}"),
                  Text("${controller.qty}"),
                  // Text("${controller.qty.value}"),
                  InkWell(
                      onTap: () {
                        controller.addToQty();
                      },
                      child: Container(
                        child: Icon(Icons.add),
                      )),
                  // Text("${cartService.cartCount}"),
                ]),
              );
            }),
          ),
        ],
      ),
    ));
  }
}

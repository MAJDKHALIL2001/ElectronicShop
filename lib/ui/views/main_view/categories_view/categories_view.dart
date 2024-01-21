import 'package:api_challenge/ui/shared/colors.dart';
import 'package:api_challenge/ui/shared/utils.dart';
import 'package:api_challenge/ui/views/description_view/description_view.dart';
import 'package:api_challenge/ui/views/main_view/categories_view/categories_controller.dart';
import 'package:api_challenge/ui/views/main_view/main_controller.dart';
import 'package:api_challenge/ui/views/main_view/product_view/product_controller.dart';
import 'package:api_challenge/ui/views/main_view/product_view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key});
  final GategoriesController controller = Get.put(GategoriesController());
  final MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsetsDirectional.only(
            start: screenWidth(20), top: screenWidth(20)),
        child: ListView(
          children: [
            Text("Categories", style: TextStyle(fontSize: screenWidth(15))),
            Obx(() {
              return controller.listGategories.isEmpty
                  // loading indicator
                  ? SpinKitCircle(
                      color: AppColors.black,
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.getAllProduct();
                              controller.selectedCategory.value =
                                  "ALL"; // Set selectedCategory to "ALL"
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    controller.selectedCategory.value == "ALL"
                                        ? AppColors
                                            .blue400 // Blue border if selected
                                        : AppColors.white,
                                border: Border.all(
                                  width: 1,
                                  color: controller.selectedCategory.value ==
                                          "ALL"
                                      ? Colors.blue // Blue border if selected
                                      : Colors.black, // Default border color
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(screenWidth(30)),
                                child: Text("ALL",
                                    style:
                                        TextStyle(fontSize: screenWidth(10))),
                              ),
                            ),
                          ),
                          Row(
                            children: controller.listGategories
                                .map((category) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          controller.getProductByGategory(
                                              category: category);
                                          controller.selectedCategory.value =
                                              category; // Set selectedCategory to the current category
                                        },
                                        child: Obx(() => Container(
                                              // Use Obx to listen for changes
                                              decoration: BoxDecoration(
                                                color: category ==
                                                        controller
                                                            .selectedCategory
                                                            .value
                                                    ? AppColors.blue400
                                                    // Blue border if selected
                                                    : AppColors.white,
                                                border: Border.all(
                                                  width: 1,
                                                  color: category ==
                                                          controller
                                                              .selectedCategory
                                                              .value
                                                      ? Colors
                                                          .blue // Blue border if selected
                                                      : Colors
                                                          .black, // Default border color
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25)),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    screenWidth(30)),
                                                child: Text(
                                                  category,
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenWidth(10)),
                                                ),
                                              ),
                                            )),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    );
            }),
            Obx(() {
              return controller.listproduct.isEmpty
                  // loading indicator

                  ? SpinKitCircle(
                      color: AppColors.black,
                    )
                  : GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7, // number of columns
                      ),
                      itemCount: controller.listproduct.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Get.to(DescriptionView(
                                infoModel: controller.listproduct[index]));
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                bottom: screenWidth(20), end: screenWidth(20)),
                            child: Container(
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: screenWidth(30)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //1.9.0
                                    //1.7.10
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                          color: AppColors.greyColor,
                                        ),
                                        width: screenWidth(4),
                                        height: screenWidth(20),
                                        child: RatingBar.builder(
                                          // initialRating: double.parse(controller
                                          //         .listproduct[index].rating
                                          //         ?.toString() ??
                                          //     "0.0"),
                                          initialRating: controller
                                                  .listproduct[index]
                                                  .rating
                                                  ?.rate ??
                                              0.0,
                                          minRating: 1,
                                          direction: Axis.vertical,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 1),
                                          itemSize: 15,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          start: screenWidth(30),
                                          top: screenWidth(20),
                                          bottom: screenWidth(20)),
                                      child: Image.network(
                                        controller.listproduct[index].image
                                            .toString(),
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          bottom: screenWidth(40)),
                                      child: Text(
                                        controller.listproduct[index].title
                                            .toString(),
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenWidth(50)),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text("price: ",
                                            style: TextStyle(
                                                color: AppColors.blue400)),
                                        Text(
                                          controller.listproduct[index].price
                                              .toString(),
                                          style:
                                              TextStyle(color: AppColors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
            }),
          ],
        ),
      )),
    );
  }
}

import 'package:api_challenge/core/data/repository/auth_repository.dart';
import 'package:get/get.dart';

import '../../../../core/data/moduls/product_info.dart';

class ProductController2 extends GetxController {
  // RxList<ProductModel> listproduct = <ProductModel>[].obs;
  var listproduct = <ProductModel>[].obs;

  @override
  void onInit() {
    getAllproduct();
    super.onInit();
  }

  void getAllproduct() async {
    final result = await AuthRepository().getallproduct();
    result.fold((l) {
      // handle error
      // BotToast.showText(text: l);
    }, (r) {
      listproduct.addAll(r);
    });
  }
}

import 'package:api_challenge/core/data/moduls/product_info.dart';
import 'package:api_challenge/core/data/repository/auth_repository.dart';
import 'package:api_challenge/ui/shared/utils.dart';
import 'package:get/get.dart';

class DescriptionController extends GetxController {
  RxInt qty = 1.obs;
  @override
  void onInit() {
    qty.value = 1;
    super.onInit();
  }

  // void addToCart(productModel) {
  //   cartService.addToCart(model: productModel, qty: qty.value);
  // }

  void addToQty() {
    qty += 1;
  }

  void subtractFromQty() {
    if (qty > 1) qty -= 1;
  }
}

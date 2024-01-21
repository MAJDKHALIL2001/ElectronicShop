import 'package:api_challenge/core/data/moduls/cart_model.dart';
import 'package:api_challenge/ui/shared/utils.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartModel> cartModel = cartService.cartList;

  RxInt m = 1.obs;
}

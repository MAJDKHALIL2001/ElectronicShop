import 'package:api_challenge/core/data/moduls/product_info.dart';
import 'package:api_challenge/core/data/repository/auth_repository.dart';
import 'package:get/get.dart';

class GategoriesController extends GetxController {
  var listproduct = <ProductModel>[].obs;
  var listGategories = <String>[].obs;
  // RxInt ind=0.obs;
  var selectedCategory = ''.obs;
  @override
  void onInit() {
    super.onInit();

    getGategories();
    getProductByGategory(category: 'electronics');
  }

  void getProductByGategory({required String category}) async {
    final result =
        await AuthRepository().getProductBycategory(Category: category);
    result.fold((l) {
      // handle error
      // BotToast.showText(text: l);
    }, (r) {
      listproduct.clear();
      listproduct.addAll(r);
    });
  }

  // void getElectronicsCatrgory() async {
  //   final result =
  //       await AuthRepository().getProductBycategory(Category: "electronics");
  //   result.fold((l) {
  //     // handle error
  //     // BotToast.showText(text: l);
  //   }, (r) {
  //     listproduct.clear();
  //     listproduct.addAll(r);
  //   });
  // }

  void getGategories() async {
    final result = await AuthRepository().getallgategory();
    result.fold((l) {
      // handle error
      // BotToast.showText(text: l);
    }, (r) {
      listGategories.addAll(r);
    });
  }

  void getAllProduct() async {
    final result = await AuthRepository().getallproduct();
    result.fold((l) {
      // handle error
      // BotToast.showText(text: l);
    }, (r) {
      listproduct.clear();
      listproduct.addAll(r);
    });
  }
}

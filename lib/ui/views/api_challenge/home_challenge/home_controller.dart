import 'package:get/get.dart';
import 'package:api_challenge/core/data/moduls/post_model.dart';
import 'package:api_challenge/core/data/repository/post_repository.dart';

class HomeController extends GetxController {
  var listpost = <PostModel>[].obs;
//  RxList<PostModel> listpost = [];
  @override
  void onInit() {
    super.onInit();
    getAllPost();
  }

  void getAllPost() async {
    final result = await PostRepository().getAllPost();
    result.fold((l) {
      // handle error
      // BotToast.showText(text: l);
    }, (r) {
      listpost.addAll(r);
    });
  }
}

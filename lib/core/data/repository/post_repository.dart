import 'package:api_challenge/core/data/moduls/common_response.dart';
import 'package:api_challenge/core/data/moduls/photo_info.dart';
import 'package:api_challenge/core/data/moduls/post_model.dart';
import 'package:api_challenge/core/data/network/network_config.dart';
import 'package:api_challenge/core/enums/request_type.dart';
import 'package:api_challenge/core/utils/network_util.dart';
import 'package:dartz/dartz.dart';

class PostRepository {
  Future<Either<String, List<PostModel>>> getAllPost() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'Posts',
        headers: NetworkConfig.getHeaders(type: RequestType.POST),
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<PostModel> result = [];

          commonResponse.data!.forEach(
            (element) {
              result.add(PostModel.fromJson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, PostModel>> AddNewPost({
    required String title,
    required String body,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          route: 'posts',
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {"title": title, "body": body, "userId": "1"}).then((value) {
        // print("hii");
        // print('Response from API: $value');
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        if (commonResponse.getStatus) {
          return Right(PostModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, PostModel>> EditPost({
    required String title,
    required String body,
    required String postNum,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.PUT,
          route: 'posts/${postNum}',
          headers: NetworkConfig.getHeaders(type: RequestType.PUT),
          body: {
            "title": "title edit",
            "body": "body edit",
            "userId": "1",
            "id": "100",
          }).then((value) {
        // print("hii");
        // print('Response from API: $value');
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        if (commonResponse.getStatus) {
          return Right(PostModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> DeletePost({required String postNum}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.DELETE,
        headers:
            NetworkConfig.getHeaders(type: RequestType.DELETE, needAuth: false),
        route: 'posts/$postNum',
      ).then((value) {
        // print("hii");
        // print('Response from API: $value');
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<PhotoInfo>>> getAllPhoto(
      {required String photoNum}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'albums/$photoNum/photos',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<PhotoInfo> listimage = [];
          commonResponse.data!.forEach((element) {
            listimage.add(PhotoInfo.fromJson(element));
          });
          return Right(listimage);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}

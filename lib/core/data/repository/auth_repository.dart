import 'package:api_challenge/core/data/moduls/common_response.dart';

import 'package:api_challenge/core/data/moduls/product_info.dart';
import 'package:api_challenge/core/data/network/network_config.dart';
import 'package:api_challenge/core/enums/request_type.dart';
import 'package:api_challenge/core/utils/network_util.dart';
import 'package:dartz/dartz.dart';
// import 'package:flutter/foundation.dart';

class AuthRepository {
  Future<Either<String, List<ProductModel>>> getallproduct() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'products',
        headers: NetworkConfig.getHeaders(type: RequestType.GET),
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<ProductModel> result = [];

          commonResponse.data!.forEach((element) {
            result.add(ProductModel.fromJson(element));
          });
          // for (var element in commonResponse.data!) {
          //   result.add(ProductModel.fromJson(element));
          //   if (result.length == 2) {
          //     break;
          //   }
          // }
          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<String>>> getallgategory() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'products/categories',
        headers: NetworkConfig.getHeaders(type: RequestType.GET),
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<String> result = [];

          commonResponse.data!.forEach(
            (element) {
              result.add(element);
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

  Future<Either<String, List<ProductModel>>> getProductBycategory(
      {required String Category}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'products/category/${Category}',
        headers: NetworkConfig.getHeaders(type: RequestType.GET),
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<ProductModel> result = [];

          commonResponse.data!.forEach(
            (element) {
              result.add(ProductModel.fromJson(element));
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
}

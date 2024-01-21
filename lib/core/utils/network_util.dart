import 'dart:convert';
import 'package:get/get.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:api_challenge/core/enums/request_type.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

import 'package:http_parser/http_parser.dart';

class NetworkUtil {
  static String baseUrl = 'fakestoreapi.com';

  static Future<dynamic> sendRequest({
    required RequestType type,
    required String route,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) async {
    var url = Uri.https(baseUrl, route, params);
    http.Response response;
    switch (type) {
      case RequestType.POST:
        response =
            await http.post(url, body: jsonEncode(body), headers: headers);
        break;
      case RequestType.GET:
        response = await http.get(url, headers: headers);
        break;
      case RequestType.DELETE:
        response =
            await http.delete(url, body: jsonEncode(body), headers: headers);
        break;
      case RequestType.PUT:
        response =
            await http.put(url, body: jsonEncode(body), headers: headers);
        break;
    }
    // print('Response status,${response.statusCode}');
    // print('Response status,${response.body}');
    //return response;
    //

    Map<String, dynamic> jsonResponse = {};
    dynamic result;
    String decodedBody = Utf8Codec().decode(response.bodyBytes);
    //في حال تركت var response ما بتطلع ال.bodybytes

    try {
      result = jsonDecode(decodedBody);
    } catch (e) {}

    jsonResponse.putIfAbsent('response',
        () => result/*== null*/ ?? {"message": decodedBody} /*: result*/);

    jsonResponse.putIfAbsent('statusCode', () => response.statusCode);

    return jsonResponse;
  }

  static Future<dynamic> sendMultipartRequest({
    required String route,
    required RequestType type,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    Map<String, String>? fields, //!Text,
    Map<String, String>? files, //*File,
  }) async {
    try {
      var request = http.MultipartRequest(
          type.toString(), Uri.https(baseUrl, route, params));

      var _filesKeyList = files!.keys.toList();
      var _filesNameList = files.values.toList();

      for (int i = 0; i < _filesNameList.length; i++) {
        if (_filesNameList[i].isNotEmpty) {
          var multipartFile = http.MultipartFile.fromPath(
            _filesKeyList[i], //! image_profile
            _filesNameList[i], //* File path
            filename: path.basename(_filesNameList[i]),
            contentType: getContentType(_filesNameList[i]),
          );
          request.files.add(await multipartFile);
        }
      }

      //? C://user/images/user.png
      //* path.basename(C://user/images/user.png) => user.png

      request.headers.addAll(headers!);
      request.fields.addAll(fields!); //? (Text type) first_name => Hazem

      var response = await request.send();

      Map<String, dynamic> responseJson = {};
      var value = await response.stream.bytesToString();

      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      responseJson.putIfAbsent('response', () => jsonDecode(value));

      return responseJson;
    } catch (error) {
      BotToast.showText(text: error.toString());
    }
  }

  static MediaType getContentType(String name) {
    //!=> user.png
    //!=> user.png.split('.')  ["user","png"]
    //!=> ["user","png"].last => Png
    var ext = name.split('.').last;
    if (ext == "png" || ext == "jpeg") {
      return MediaType.parse("image/jpg");
    } else if (ext == 'pdf') {
      return MediaType.parse("application/pdf");
    } else {
      return MediaType.parse("image/jpg");
    }
  }
}

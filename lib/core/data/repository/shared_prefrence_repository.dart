import 'dart:convert';

// import 'package:flutter/material.dart';

import 'package:api_challenge/core/data/moduls/cart_model.dart';
import 'package:api_challenge/core/data/moduls/token_info.dart';
import 'package:api_challenge/core/enums/data_type.dart';
import 'package:api_challenge/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceRepository {
  SharedPreferences pref = prefs;

  //!--- Keys
  String PREF_FIRST_LUNCH = 'first_lunch';
  String PREF_IS_LOGGED = 'is_logged';
  String PREF_SAVE_PASSWORD = 'is_saved_password';
  String PREF_SAVE_USERNAME = 'is_saved_userName';
  String PREF_LOGED_INFO = 'loged_info';
  String PREF_TOKEN_INFO = 'token_info';
  String PREF_CART_LIST = 'cart_list';

  //* --- ----

  void setCartList(List<CartModel> list) {
    setPrefrnce(
        type: DataType.STRING,
        key: PREF_CART_LIST,
        value: CartModel.encode(list));
  }

  List<CartModel> getCartList() {
    if (pref.containsKey(PREF_CART_LIST)) {
      return CartModel.decode(getPrefrnce(PREF_CART_LIST));
    } else {
      return [];
    }
  }

  //* --- ----

  TokenInfo getTokenInfo() {
    return TokenInfo.fromJson(jsonDecode(getPrefrnce(PREF_TOKEN_INFO)));

    //!--- get String from shared
    ////* getPrefrnce(PREF_TOKEN_INFO)
    //!--- String to json using jsonDecode
    ////*jsonDecode
    //!-- create token info mode from josn
    ////*TokenInfo.fromJson
  }

  void setTokenInfo(TokenInfo info) {
    setPrefrnce(
        type: DataType.STRING,
        key: PREF_TOKEN_INFO,
        value: jsonEncode(info.toJson()));

    // //!--- info to json
    // Map<String, dynamic> infoMap = info.toJson();
    // //!-- json to string using jsonEncode
    // String strInfo = jsonEncode(infoMap);
    // //!-- Save string in shared
    // setPrefrnce(type: DataType.STRING, key: PREF_TOKEN_INFO, value: strInfo);
  }

  void setLogginInfo(List<String> value) {
    setPrefrnce(type: DataType.LISTSTRING, key: PREF_LOGED_INFO, value: value);
  }

  List<String> getLogginInfo() {
    if (pref.containsKey(PREF_LOGED_INFO)) {
      List<Object?> list = getPrefrnce(PREF_LOGED_INFO);
      print(list);
      List<String> result = [];
      list.forEach((Element) {
        result.add(Element.toString());
      });
      return result;
    } else
      return [];
  }

  void setPassword(String value) {
    setPrefrnce(type: DataType.STRING, key: PREF_SAVE_PASSWORD, value: value);
  }

  String? getPassword() {
    if (pref.containsKey(PREF_SAVE_PASSWORD))
      return getPrefrnce(PREF_SAVE_PASSWORD);
    else
      return null;
  }

  void setUserName(String value) {
    setPrefrnce(type: DataType.STRING, key: PREF_SAVE_USERNAME, value: value);
  }

  String? getUserName() {
    if (pref.containsKey(PREF_SAVE_USERNAME))
      return getPrefrnce(PREF_SAVE_USERNAME);
    else
      return null;
  }

  void setFirstLunch(bool value) {
    setPrefrnce(type: DataType.BOOL, key: PREF_FIRST_LUNCH, value: value);
  }

  bool getFirstLunch() {
    if (pref.containsKey(PREF_FIRST_LUNCH))
      return getPrefrnce(PREF_FIRST_LUNCH);
    else
      return true;
  }

  void setFirstLogin(value) {
    setPrefrnce(type: DataType.BOOL, key: PREF_IS_LOGGED, value: value);
  }

  bool getFirstLogin() {
    if (pref.containsKey(PREF_IS_LOGGED))
      return getPrefrnce(PREF_IS_LOGGED);
    else
      return false;
  }

  setPrefrnce({
    required DataType type,
    required String key,
    required dynamic value,
  }) async {
    switch (type) {
      case DataType.STRING:
        await prefs.setString(key, value);
        break;
      case DataType.INT:
        await prefs.setInt(key, value);
        break;
      case DataType.BOOL:
        await prefs.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await prefs.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await prefs.setStringList(key, value);
        break;
    }
  }

  dynamic getPrefrnce(String key) {
    return pref.get(key);
  }
}

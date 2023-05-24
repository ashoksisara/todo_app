import 'dart:convert';
import 'package:flutter/material.dart';
import '../shared/constants/app_string.dart';
import '../shared/widgets/progress_dialog.dart';
import 'logger.dart';
import 'reachability.dart';


class Utils {
  factory Utils() {
    return _singleton;
  }

  static final Utils _singleton = Utils._internal();

  Utils._internal() {
    Logger().v("Instance created Utils");
  }


  static Map<String, String> convertMapToString(dynamic map) {

    Map<dynamic, dynamic> mapDynamic;
    if (map is String) {
      var obj = json.decode(map);
      mapDynamic = obj;
    } else if (map is Map<dynamic, dynamic>) {
      mapDynamic = map;
    } else {
      return <String, String>{};
    }

    Map<String, String> convertedMap = <String, String>{};
    for (dynamic key in mapDynamic.keys) {
      if ((key is String) && (mapDynamic[key] is String)) {
        convertedMap[key] = mapDynamic[key];
      }
    }
    return convertedMap;
  }

  /// Used for update page list
  bool isApiCallRequired = false;

  //region Convert Map
  static Map<String, dynamic> convertMap(dynamic map) {
    Map<dynamic, dynamic> mapDynamic;
    if (map is String) {
      var obj = json.decode(map);
      mapDynamic = obj;
    } else if (map is Map<dynamic, dynamic>) {
      mapDynamic = map;
    } else {
      return <String, dynamic>{};
    }

    Map<String, dynamic> convertedMap = <String, dynamic>{};
    for (dynamic key in mapDynamic.keys) {
      if (key is String) {
        convertedMap[key] = mapDynamic[key];
      }
    }
    return convertedMap;
  }

  static void showSnackBar(GlobalKey<ScaffoldState> key, String msg){

  }


//endregion

  static bool isInternetAvailable(GlobalKey<ScaffoldState> key, {bool isInternetMessageRequire = true}) {
    bool isInternet = Reachability().isInterNetAvailable();
    if (!isInternet && isInternetMessageRequire) {
      Utils.showSnackBar(key, AppString.noInternetMessage);
    }
    return isInternet;
  }

  static void showProgressDialog(BuildContext context) {
    Logger().v("DisPlay Loader");
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => const ProgressDialog());
  }

  static Future dismissProgressDialog(BuildContext context) async {
    /// This Delay Added due to loader open or not
    await Future.delayed(const Duration(milliseconds: 100));
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    return null;
  }





}



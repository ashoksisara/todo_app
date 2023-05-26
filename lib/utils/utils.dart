import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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



  static String dateToString(DateTime date, {String? format}) {
    DateFormat formatter = DateFormat(format);
    try {
      return formatter.format(date);
    } catch (e) {
      debugPrint('Error formatting date: $e');
    }
    return '';
  }

  static String dateUTCtoLocal(DateTime date, {String? format}) {
    DateFormat formatter = DateFormat(format);
    try {
      return formatter.format(date.toLocal());
    } catch (e) {
      debugPrint('Error formatting date: $e');
    }
    return '';
  }


}

class AppDateFormat{
  static String shortMonthFormat = "MMM dd, yyyy";
  static String dayMonthFormat = "MMM dd";
  static String fullDateTimeFormat = "MMM d yyyy, h:mm aa";
}


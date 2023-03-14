import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static String dateFormatter([DateTime? date]) {
    DateTime curDateTime = date ?? DateTime.now();
    var year = curDateTime.year.toString();
    var month = curDateTime.month.toString();
    var day = curDateTime.day.toString();

    return '$year.${month.length == 1 ? '0$month' : month}.${day.length == 1 ? '0$day' : day}';
  }
}

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}

class Format {
  static NumberFormat currency = NumberFormat('###,###,###,###');
}

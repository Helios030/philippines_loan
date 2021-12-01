import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:philippines_loan/service/config.dart';



extension createCommonParams on Map<String, dynamic>{
  Map<String, dynamic> get create {
    this["app_version"] = PackConfig.version;
    this["appversion"] = PackConfig.version;
    this["version"] = "1.0";
    this["channel"] = "1";
    this["imei"] = PackConfig.uuid;
    this["timestamp"] = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    this["pkg_name"] = PackConfig.packageName;
    this["sign"] = md5.convert(utf8.encode(this.toString())).toString();
    return this;
  }
}


toast(String? message) {
  if (message != null) {
    Fluttertoast.showToast(msg: message);
  }
}


extension NullCheck on dynamic {
  bool isNull() {
    return this == null || this == "null" || this == "NULL";
  }

  bool isEmpty() {
    return this == "";
  }

  bool isNullOrEmpty() {
    return isNull() || isEmpty();
  }

  bool isNotEmpty() {
    return !isEmpty();
  }

  bool isNotNull() {
    return !isNull();
  }

  bool isSafe() {
    return !isNull() && !isEmpty();
  }


}


extension BoolExt on bool {
  bool not() {
    return !this;
  }

  bool and(bool val) {
    return this && val;
  }

  bool or(bool val) {
    return this || val;
  }
}


extension ContextExt on BuildContext {
  startTo(String routeName, {var isNewTask = false}) {
    if (isNewTask) {
      Navigator.of(this).pushNamedAndRemoveUntil(
          routeName, (Route<dynamic> route) => false);
    } else {
      Navigator.pushNamed(this, routeName);
    }
  }

  finish(){
    Navigator.pop(this);
  }


}








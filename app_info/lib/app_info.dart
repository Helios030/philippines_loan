
import 'dart:async';

import 'package:flutter/services.dart';

class AppInfo {
  static const MethodChannel _channel = MethodChannel('app_info');

  static Future<List<dynamic>?> get getAPPs async {
    final List<dynamic>? APPList = await _channel.invokeMethod('getAPPs');
    return APPList;
  }

}

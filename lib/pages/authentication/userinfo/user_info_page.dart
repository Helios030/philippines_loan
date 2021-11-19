import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


var userDataMap = <String, dynamic>{};

class NUserInfoWidget extends StatelessWidget {
  static String routeName = "/user_info";

  const NUserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: null,
    );
  }
}
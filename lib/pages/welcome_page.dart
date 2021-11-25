import 'package:battery/battery.dart';
import "package:flutter/material.dart";
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/sp_key.dart';
import 'package:philippines_loan/utils/utils.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import '../resource.dart';
import 'home/home_screen.dart';
import 'login/login_page.dart';
import 'main/main_page.dart';

var isFirst = true;

class NWelComePage extends StatefulWidget {
  static const String routeName = "/";

  @override
  State<NWelComePage> createState() => _NWelComePageState();
}

class _NWelComePageState extends State<NWelComePage> {
  @override
  void initState() {
    super.initState();
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
    sp_data.put(SPKey.OPENTIME.toString(), currentTimeMillis().toString());
    Battery().batteryLevel.then((value) {
      sp_data.put(SPKey.OPENPOWER.toString(), value.toString());
    });
    if (isFirst) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        sp_data.get(SPKey.USERID.toString(), "").then((value) {
          String? UserId = value;
          //todo 测试阶段
          if (UserId == null || UserId == "") {
            context.startTo( NLoginPage.routeName, isNewTask: true);
          } else {
            context.startTo( NMainPage.routeName, isNewTask: true);
          }
        });
        isFirst = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //屏幕适配
    ScreenUtil.init(
    BoxConstraints(maxWidth: MediaQuery.of(context).size.width, maxHeight: MediaQuery.of(context).size.height), designSize: const Size(375, 667), orientation: Orientation.portrait);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          height: 300.h,
          width: 280.w,
          child: Image.asset(nimg_welcome.assetName),
        ),
      ),
    );
  }
}

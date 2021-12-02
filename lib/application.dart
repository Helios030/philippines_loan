import 'dart:io';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:liveness_plugin/liveness_plugin.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:philippines_loan/pages/authentication/card/card_info_page.dart';
import 'package:philippines_loan/pages/authentication/contact/contact_info_page.dart';
import 'package:philippines_loan/pages/authentication/idcard/id_card_page.dart';
import 'package:philippines_loan/pages/authentication/user_info_menu_page.dart';
import 'package:philippines_loan/pages/authentication/userinfo/user_info_page.dart';
import 'package:philippines_loan/pages/authentication/work/work_info_page.dart';
import 'package:philippines_loan/pages/confirm/confirm_page.dart';
import 'package:philippines_loan/pages/face/face_detect.dart';
import 'package:philippines_loan/pages/home/home_screen.dart';
import 'package:philippines_loan/pages/login/login_page.dart';
import 'package:philippines_loan/pages/main/main_page.dart';
import 'package:philippines_loan/pages/orders/orders_page.dart';
import 'package:philippines_loan/pages/repayment/repayment_page.dart';
import 'package:philippines_loan/pages/welcome_page.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/af_utils.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/sp_key.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import 'generated/l10n.dart';




class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  @override
  void initState() {
    super.initState();
    initPageInfo();
    // getAF();
    initLive();
    initLoadding();
    trackAFActivationEvent();
    uploadDownoknotify();
    Slog.init(isDebug: true);

  }

  @override
  Widget build(BuildContext context) {
    //屏幕适配
    // ScreenUtil.init(BoxConstraints(maxWidth: MediaQuery.of(context).size.width, maxHeight: MediaQuery.of(context).size.height), designSize: const Size(375, 760), orientation: Orientation.portrait);



    return MaterialApp(
        builder:  EasyLoading.init(builder: (context, widget) {
          return MediaQuery(
            //设置文字大小不随系统设置改变
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        })
        ,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
          GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
          GlobalWidgetsLocalizations.delegate, // 指定默认的文本排列方向, 由左到右或由右到左
          S.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          primaryColor: Colors.white,
          primaryColorLight: Colors.white,
          primaryColorDark: Colors.white,
          brightness: Brightness.light,
        ),
        initialRoute: "/",
        routes: {
          // 显式声明路由
          NWelComePage.routeName: (context) => NWelComePage(),
          NLoginPage.routeName: (context) => NLoginPage(),
          NHomePage.routeName: (context) => NHomePage(),
          NMainPage.routeName: (context) => NMainPage(),
          NFaceDetectorWidget.routeName: (context) => NFaceDetectorWidget(),
          NUserInfoMenuPager.routeName: (context) => NUserInfoMenuPager(),
          NUserInfoWidget.routeName: (context) => NUserInfoWidget(),
          NContactInfoWidget.routeName: (context) => NContactInfoWidget(),
          NWorkInfoWidget.routeName: (context) => NWorkInfoWidget(),
          NCardInfoWidget.routeName: (context) => NCardInfoWidget(),
          NOrdersPage.routeName: (context) => NOrdersPage(),
          NIdCardPage.routeName: (context) => NIdCardPage(),
          NConfirmPageWidget.routeName: (context) =>  NConfirmPageWidget(),
          NRePaymentPage.routeName: (context) =>  NRePaymentPage(),


        });
  }




  void uploadDownoknotify() {
    SPData.get(SPKey.ISFITST.toString(), true).then((isFirst){
      if(isFirst){
        SPData.put(SPKey.ISFITST.toString(), false);
        trackInstallEvent();
        request(UriPath.downoknotify, {
          "uuid":PackConfig.uuid,
          "imei":PackConfig.uuid,
          "referrer":"ios",
          "download_time":DateTime.now() }).then((value) {
          //print("第一次上傳結果  $value");
        });
      }
    });
  }
}


void initLoadding() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.wave
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = N.red20
    ..backgroundColor = Colors.white
    ..indicatorColor = N.red20
    ..textColor = N.red20
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;

}

AppsflyerSdk? appsflyerSdk;
AppsflyerSdk getAF(){

  if(appsflyerSdk == null){
    Map appsFlyerOptions = { };

    if(Platform.isAndroid){
      appsFlyerOptions = { "afDevKey": "u8UXUBArQjHx9kH8M69Qrd", "isDebug": false};
    }else{
      appsFlyerOptions = { "afDevKey": "", "afAppId": "", "isDebug": true};
    }

    appsflyerSdk = AppsflyerSdk(appsFlyerOptions);
    appsflyerSdk!.initSdk(
        registerConversionDataCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerOnDeepLinkingCallback: true
    );
  }

  return appsflyerSdk!;

}

void initLive() {
  LivenessPlugin.initSDKOfLicense(Market.Thailand);
}


void initPageInfo() {
  /**
   * packageName 有时获取不到
   * 缺少  sign
   *
   * */
  PackageInfo.fromPlatform().then((info) {
    PackConfig.appName = info.appName;
    // PackConfig.packageName = info.packageName == "" ? "com.neutron.philippines_loan" : info.packageName;
    //ios
    PackConfig.packageName = "com.neutron.philippines_loan" ;
    PackConfig.version = info.version;
    PackConfig.buildNumber = info.buildNumber;
    //print("fromPlatform  ${PackConfig().toString()}");
  });
  var uuid = const Uuid(options: {'grng': UuidUtil.cryptoRNG});
  SPData.get(SPKey.UUID.toString(), "").then((value) {
    Slog.d("获取UUID  $value");
    Slog.d("随机UUID  $value");

    if (value == null||value=="") {
      String uu = uuid.v1();
      PackConfig.uuid = uu;
      SPData.put(SPKey.UUID.toString(), uu);
    } else {
      PackConfig.uuid = value;

    }
    Slog.d("UUID: " +  PackConfig.uuid );
  });


}
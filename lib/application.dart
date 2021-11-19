import 'dart:io';
import 'package:flutter/material.dart';
import 'package:philippines_loan/pages/home/home_screen.dart';
import 'package:philippines_loan/pages/login/login_page.dart';
import 'package:philippines_loan/pages/main/main_page.dart';
import 'package:philippines_loan/pages/welcome_page.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/af_utils.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/sp_key.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:liveness_plugin/liveness_plugin.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  @override
  void initState() {
    super.initState();

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
        });
  }

  void uploadDownoknotify() {
    sp_data.get(SPKey.ISFITST.toString(), true).then((isFirst){
      if(isFirst){
        sp_data.put(SPKey.ISFITST.toString(), false);
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
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = N.meetff
    ..backgroundColor = Colors.white
    // ..indicatorColor = N.meetff
    // ..textColor = N.meetff
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

Future<void> initPageInfo() async {
  /**
   * packageName 有时获取不到
   * 缺少  sign
   *
   * */
  var info= await PackageInfo.fromPlatform();
    PackConfig.appName = info.appName;
    PackConfig.packageName = info.packageName == "" ? "com.neutron.richmoney" : info.packageName;
    PackConfig.version = info.version;
    PackConfig.buildNumber = info.buildNumber;

  var uuid = const Uuid(options: {'grng': UuidUtil.cryptoRNG});
  sp_data.get(SPKey.UUID.toString(), "").then((value) {
    slog.d("获取UUID  $value");
    if (value == null||value=="") {
      PackConfig.uuid = uuid.toString();
      sp_data.put(SPKey.UUID.toString(), uuid.toString());
    } else {
      PackConfig.uuid = value;
    }
    slog.d("UUID: " +  PackConfig.uuid );
  });
}


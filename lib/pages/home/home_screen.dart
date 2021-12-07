import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/model/loan_status.dart';
import 'package:philippines_loan/model/s_user_config.dart';
import 'package:philippines_loan/pages/home/fail_screen.dart';
import 'package:philippines_loan/pages/home/over_screen.dart';
import 'package:philippines_loan/pages/home/product_screen.dart';
import 'package:philippines_loan/pages/home/review_screen.dart';
import 'package:philippines_loan/pages/home/wait_pay_screen.dart';
import 'package:philippines_loan/pages/widgets/dialog_widget.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/constant.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/sp_key.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'loan_screen.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';



class NHomePage extends StatefulWidget {
  const NHomePage({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<NHomePage> createState() => _NHomePageState();
}

class _NHomePageState extends State<NHomePage> {
  LoanstatusResult? loanResult;
  Widget currPage = const ProductScreenWidget(null);

  @override
  void initState() {
    super.initState();
    queyLoanStatus();
    queyUserConfig();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    Future.delayed(Duration(seconds: 2), (){

     // todo 需要切换优惠卷弹框模式

     // showMyDialog(context, WebView(
     //   initialUrl: "https://www.baidu.com/",
     //   //JS执行模式 是否允许JS执行
     //   javascriptMode: JavascriptMode.unrestricted,
     // ),heightSize: 335.h,widthSize: 270.w,dismissible: true);


    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: EasyRefresh(
          header: MaterialHeader(),
          onRefresh: () async {
            queyLoanStatus();
          },
          child:

          SingleChildScrollView(
            child: Container(
              height: 667.h,
              alignment: Alignment.center,
              child: currPage,
            ),
          )


          ,),
        // child: currPage,
      ),
    );
  }

  void queyLoanStatus() {
    SPData.get(SPKey.USERID.toString(), "").then((id) {
      Map<String, dynamic> dataMap = {};
      dataMap["user_id"] = id;
      request(UriPath.queryloanstatus, dataMap).then((value) {
        Loanstatus jsonResult = Loanstatus.fromJson(value);
        if (jsonResult.code == "200") {
          loanResult = jsonResult.result;
          //保存当前id与待还金额
          Slog.d("请求贷款状态返回  $loanResult");
          SPData.put(SPKey.APPLICATIONID.toString(), loanResult!.applicationId);
          SPData.put(SPKey.AMOUNT.toString(), loanResult!.remainAmount);

          switch (int.parse(loanResult!.loanStatus!)) {
            case STATE_LOANING:
              currPage = LoanScreenWidget(loanResult);
              break;


            case STATE_APPLYING:
              currPage = ReviewScreenWidget(loanResult);
              SPData.put(SPKey.ISSHOWFAILE.toString(), true);
              break;
            case STATE_APPROint_REJECTED:
              //需要判断
              currPage = FailScreenWidget(loanResult);
              SPData.get(SPKey.ISSHOWFAILE.toString(), true).then((value) {
                //print("是否可借  $value");
                if (value) {
                  SPData.put(SPKey.ISSHOWFAILE.toString(), false);
                } else {
                  currPage = ProductScreenWidget(loanResult);
                }
              });
              break;
            case STATE_PENDING_REPAYMENT:
              currPage = WaitPayScreenWidget(loanResult);
              break;
            case STATE_OVERDUE:
              currPage = OverScreenWidget(loanResult);
              break;
            case STATE_BORROWABLE:
              currPage = ProductScreenWidget(loanResult);
              break;
          }
          setState(() {});
        } else {
          toast(jsonResult.message);
        }
      });
    });
  }
}

void queyUserConfig() {
  SPData.get(SPKey.USERID.toString(), "").then((id) {
    request(UriPath.config, {"user_id": id}).then((value) {
      var JsonUser = S_user_config.fromJson(value);
      if (JsonUser.result != null) {
        SPData.put(SPKey.KPRIVATE.toString(), JsonUser.result!.kPrivate);
        SPData.put(SPKey.HOTTEL.toString(), JsonUser.result!.hotTel);
        SPData.put(SPKey.ABOUTUS.toString(), JsonUser.result!.aboutUs);
      }
    });
  });
}

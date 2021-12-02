import 'package:flutter/material.dart';
import 'package:philippines_loan/model/loan_status.dart';
import 'package:philippines_loan/model/s_user_config.dart';
import 'package:philippines_loan/pages/home/fail_screen.dart';
import 'package:philippines_loan/pages/home/over_screen.dart';
import 'package:philippines_loan/pages/home/product_screen.dart';
import 'package:philippines_loan/pages/home/review_screen.dart';
import 'package:philippines_loan/pages/home/wait_pay_screen.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/constant.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/sp_key.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/slog.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: currPage,
      ),
    );
  }

  void queyLoanStatus() {
    sp_data.get(SPKey.USERID.toString(), "").then((id) {
      Map<String, dynamic> dataMap = {};
      dataMap["user_id"] = id;
      request(UriPath.queryloanstatus, dataMap).then((value) {
        Loanstatus jsonResult = Loanstatus.fromJson(value);
        if (jsonResult.code == "200") {
          loanResult = jsonResult.result;
          //保存当前id与待还金额
          sp_data.put(
              SPKey.APPLICATIONID.toString(), loanResult!.applicationId);
          sp_data.put(SPKey.AMOUNT.toString(), loanResult!.remainAmount);
          slog.d("请求贷款状态返回  $loanResult");
          switch (int.parse(loanResult!.loanStatus!)) {
            case STATE_LOANING:
            case STATE_APPLYING:
              currPage = ReviewScreenWidget(loanResult);
              sp_data.put(SPKey.ISSHOWFAILE.toString(), true);
              break;
            case STATE_APPROint_REJECTED:
              //需要判断
              currPage = FailScreenWidget(loanResult);
              sp_data.get(SPKey.ISSHOWFAILE.toString(), true).then((value) {
                //print("是否可借  $value");
                if (value) {
                  sp_data.put(SPKey.ISSHOWFAILE.toString(), false);
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
  sp_data.get(SPKey.USERID.toString(), "").then((id) {
    request(UriPath.config, {"user_id": id}).then((value) {
      var JsonUser = S_user_config.fromJson(value);
      if (JsonUser.result != null) {
        sp_data.put(SPKey.KPRIVATE.toString(), JsonUser.result!.kPrivate);
        sp_data.put(SPKey.HOTTEL.toString(), JsonUser.result!.hotTel);
        sp_data.put(SPKey.ABOUTUS.toString(), JsonUser.result!.aboutUs);
      }
    });
  });
}

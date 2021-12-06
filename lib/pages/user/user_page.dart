import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/loan_status.dart';
import 'package:philippines_loan/pages/authentication/user_info_menu_page.dart';
import 'package:philippines_loan/pages/coupon/coupon_widget.dart';
import 'package:philippines_loan/pages/login/login_page.dart';
import 'package:philippines_loan/pages/orders/orders_page.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/pop_view.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/sp_key.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resource.dart';

class NUserPage extends StatefulWidget {
  const NUserPage({Key? key}) : super(key: key);
  static const String routeName = "/user";

  @override
  State<NUserPage> createState() => _NUserPageState();
}

class _NUserPageState extends State<NUserPage> {
  LoanstatusResult? loanResult;

  var phone = "";
  var money = "0";
  var date = "";

  @override
  void initState() {
    super.initState();

    SPData.get(SPKey.PHONE.toString(), "").then((value) {
      phone = value;
      setState(() {});
    });

    SPData.get(SPKey.USERID.toString(), "").then((id) {
      Map<String, dynamic> dataMap = {};
      dataMap["user_id"] = id;
      request(UriPath.queryloanstatus, dataMap).then((value) {
        Loanstatus jsonResult = Loanstatus.fromJson(value);
        if (jsonResult.code == "200") {
          loanResult = jsonResult.result;
          if(loanResult!.reachAmount!=null){
            money = loanResult!.reachAmount.toString();
          }

          date = loanResult!.depositTime.toString();
          setState(() {});
        } else {
          toast(jsonResult.message);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: (nicon_my_bg),
        fit: BoxFit.fill, /* 完全填充*/
      )),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 42.h, left: 14.w, bottom: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 11.w),
                    width: 42.r,
                    height: 42.r,
                    child: Image(
                      image: (nimg_user_icon),
                    )),
                TextView(
                  phone,
                  color: N.meetC4,
                  size: 16,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Align(
            child: Column(
              children: [
                TextView(
                  S.current.amount_repaid,
                  color: N.meetC4,
                  size: 16,
                  textAlign: TextAlign.center,
                ),
                TextView(
                  money,
                  color: N.meetC4,
                  size: 42,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          money != "0"
              ? Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 12.h, right: 20.w),
                  child: TextView(
                    S.current.repayment_date + date,
                    color: N.meetC4,
                    size: 16,
                    textAlign: TextAlign.end,
                  ),
                )
              : Container(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 14.h),
              color: Colors.white,
              child: Column(
                children: [
                  userItemWidget(S.current.my_loan, nicon_my_loan, onclick: () {
                    context.startTo(NOrdersPage.routeName);
                  }),
                  userItemWidget(S.current.my_info, nicon_my_user_info,
                      onclick: () {
                    context.startTo(NUserInfoMenuPager.routeName);
                  }),
                  userItemWidget(S.of(context).my_coupon, nicon_my_coupon, onclick: () {
                    context.startTo(NCouponWidget.routeName);
                  }),
                  Container(
                    height: 9.h,
                    color: N.grayF2,
                  ),
                  userItemWidget(
                    S.current.about_us,
                    nicon_my_about,
                    onclick: () {
                      SPData.get(SPKey.ABOUTUS.toString(), "").then((value) {
                        if (value != null && value != "") {
                          launch(value);
                        }
                      });
                    },
                  ),
                  userItemWidget(
                    S.current.my_call,
                    nicon_my_user_call,
                    onclick: () {
                      showSimplePop(context, S.of(context).call_user_tip, () {
                        SPData.get(SPKey.HOTTEL.toString(), "").then((value) {
                          launch("tel://$value");
                        });
                      }, () {
                        context.finish();
                      });
                    },
                  ),
                  userItemWidget(
                    S.current.my_exit,
                    nicon_my_exit,
                    onclick: () {
                      showSimplePop(context, S.current.exit_app_tip, () {
                        SPData.clear();
                        context.startTo(NLoginPage.routeName, isNewTask: true);
                      }, () {
                        context.finish();
                      });
                    },
                  ),
                  Expanded(
                      child: Container(
                    height: 9.h,
                    color: N.grayF2,
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

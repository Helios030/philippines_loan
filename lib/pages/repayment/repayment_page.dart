import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/menu.dart';
import 'package:philippines_loan/model/va_result.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/item_text_view.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/sp_key.dart';

import '../../resource.dart';

var rePaymentDataMap = <String, dynamic>{};

class NRePaymentPage extends StatefulWidget {
  NRePaymentPage({Key? key}) : super(key: key);

  static const String routeName = "/repayment";

  @override
  State<NRePaymentPage> createState() => _NRePaymentPageState();
}

class _NRePaymentPageState extends State<NRePaymentPage> {
  bool isPayAll = false;
  VAResult? vaResult;
  var amount = "";
  var user_id = "";
  var applicationId = "";
  var inputBankCode = "";
  var selectBank = "";
  var startTime = "";
  var endTime = "";

  var repayment_bank = S.current.please_check;

  MenuItem? currItem;

  @override
  void initState() {
    super.initState();

    getVA({"bank_code": "OFFLINE"}, isInfo: true).then((value) {
      var jsonResult = Va_result. fromJson(value);
      if (jsonResult.code == "200") {
        vaResult = jsonResult.result;
        rePaymentDataMap["bankCardNo"] = vaResult!.va!;
        //print("top menu $jsonResult");
        amount = vaResult!.amount!;

        startTime = vaResult!.startTime;
        endTime = vaResult!.endTime;

        rePaymentDataMap["amount"] = amount;
        rePaymentDataMap["vaType"] = isPayAll ? "1" : "2";

        setState(() {});
      } else {
        toast(jsonResult.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    isPayAll = ModalRoute.of(context)!.settings.arguments! as bool;
    var title = isPayAll ? S.current.all_pay : S.current.sub_pay;
    return SingleChildScrollView(
      child: Container(
        width: 375.w,
        height: 900.h,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: (nicon_my_bg),
          fit: BoxFit.fill, /* 完全填充*/
        )),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 30.h),
                child: TextView(
                  title,
                  size: 18,
                )),
            Container(
              margin: EdgeInsets.only(top: 31.h),
              padding: EdgeInsets.only(left: 20.w, top: 18.h),
              width: 342.w,
              height: 104.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: (nimg_value_bg_confirm),
                fit: BoxFit.fill, /* 完全填充*/
              )),
              child: Stack(
                children: [
                  TextView(
                    S.current.amount_repaid,
                    color: N.black36,
                  ),
                  Center(
                      child: TextView(
                    amount,
                    color: N.red20,
                    size: 40,
                  )),
                ],
              ),
            ),
            isPayAll
                ? Container()
                : Container(
                    margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                    padding: EdgeInsets.only(
                        left: 31.w, top: 20.h, right: 31.w, bottom: 20.h),
                    width: 342.w,
                    height: 104.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        showTextView(
                          S.current.start_time,
                          startTime,
                        ),
                        showTextView(
                          S.current.end_time,
                          endTime,
                          isShowLine: false,
                        ),
                      ],
                    ),
                  ),
            Container(
              margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
              width: 342.w,
              height: 236.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.h, left: 21.w, right: 31.w),
                    child: ItemTextView(
                        S.of(context).repayment_bank, repayment_bank,
                        onBank: (menu) {
                      repayment_bank = menu.menuName;

                      currItem = menu;
                    }),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 14.h),
                    width: 345.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: (nimg_main_loan_value_bg),
                      fit: BoxFit.fill, /* 完全填充*/
                    )),
                    child: TextView(
                      S.of(context).skypay_tip,
                      size: 12,
                      color: N.red20,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 26.h,
                      ),
                      ButtonView("生成还款码", () {
                        if (currItem == null) {
                          toast("请先选择还款银行");
                          return;
                        }

                        getVA({
                          "bank_code": currItem!.menuName,
                        }).then((value) {
                          var jsonResult = Va_result.fromJson(value);
                          if (jsonResult.code == "200") {
                            vaResult = jsonResult.result;
                            rePaymentDataMap["bankCardNo"] = vaResult!.va!;
                            //print("top menu $jsonResult");
                            amount = vaResult!.amount!;

                            startTime = vaResult!.startTime;
                            endTime = vaResult!.endTime;

                            rePaymentDataMap["amount"] = amount;
                            rePaymentDataMap["vaType"] = isPayAll ? "1" : "2";

                            setState(() {});
                          } else {
                            toast(jsonResult.message);
                          }
                        });
                      }),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 14.h),
              padding: EdgeInsets.only(left: 29.w, top: 13.h, bottom: 10.h),
              width: 342.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 60.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: (nimg_main_loan_value_bottom_bg),
                          fit: BoxFit.fill, /* 完全填充*/
                        )),
                        child: TextView(
                          "72827 72839 72783",
                          color: N.black33,
                          textAlign: TextAlign.center,
                          size: 24,
                        ),
                      ),
                      TextView(
                        S.of(context).repayment_digital_code,
                        color: N.black36,
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                            width: 86.r,
                            height: 86.r,
                            margin: EdgeInsets.only(top: 20.h),
                            child: Image(
                              image: nimg_face_d,
                            )),
                      ),
                      Container(
                        width: 342.w,
                        child: TextView(
                          S.of(context).repayment_digital_qr,
                          color: N.black36,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 26.h,
            ),
          ],
        ),
      ),
    );
  }

  getVA(Map<String, dynamic> vaMap, {bool isInfo = false}) async {
    amount = await SPData.get(SPKey.AMOUNT.toString(), "");

    applicationId = await SPData.get(SPKey.APPLICATIONID.toString(), "");

    vaMap["user_id"] = user_id;
    vaMap["amount"] = amount;
    vaMap["atm_otc"] = "1";
    vaMap["application_id"] = applicationId;
    vaMap["vaType"] = isPayAll ? "1" : "2";
    return await request(isInfo ? UriPath.getVaInfo : UriPath.getva, vaMap);
  }
}

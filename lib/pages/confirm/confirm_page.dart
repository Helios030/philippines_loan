import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/confirm_result.dart';
import 'package:philippines_loan/model/s_confirm_info.dart';
import 'package:philippines_loan/pages/home/home_screen.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/dialog_widget.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/af_utils.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/sp_key.dart';
import 'package:philippines_loan/utils/utils.dart';

import '../../resource.dart';

class NConfirmPageWidget extends StatefulWidget {
  static const String routeName = "/confirm";

  const NConfirmPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NConfirmPageWidget> createState() => _NConfirmPageWidgetState();
}

class _NConfirmPageWidgetState extends State<NConfirmPageWidget> {
  var loan_amount = "";
  var loan_period = 7;

  var pay = "";
  var risk = "";
  var service = "";
  var interest = "";
  var fale_fee = "";
  var penalty = "";
  var overduePenalty = "";
  var withdrawal_method = "";
  var withdrawal_method_number = "";

  @override
  void initState() {
    super.initState();
    sp_data.get(SPKey.USERID.toString(), "").then((id) {
      sp_data.get(SPKey.PRODUCTID.toString(), 0).then((productId) {
        request(UriPath.confirm, {"user_id": id, "product_id": productId})
            .then((value) {
          var jsonResult = S_confirm_info.fromJson(value);
          if (jsonResult.code == "200") {
            var sConfirmResult = jsonResult.result;

            slog.d("sConfirmResult   $sConfirmResult");

            if (sConfirmResult != null) {
              if (sConfirmResult.amount2Account != null) {
                loan_amount = sConfirmResult.amount2Account!;
              }
              if (sConfirmResult.duration != null) {
                loan_period = sConfirmResult.duration!;
              }
              if (sConfirmResult.pay != null) {
                pay = sConfirmResult.pay!;
              }
              if (sConfirmResult.risk != null) {
                risk = sConfirmResult.risk!;
              }
              if (sConfirmResult.service != null) {
                service = sConfirmResult.service!;
              }
              if (sConfirmResult.penalty != null) {
                penalty = sConfirmResult.penalty!;
              }
              if (sConfirmResult.penalty != null) {
                withdrawal_method = sConfirmResult.bankName!;
              }
              if (sConfirmResult.penalty != null) {
                withdrawal_method_number = sConfirmResult.cardNo!;
              }

              if (sConfirmResult.rate != null) {
                interest = sConfirmResult.rate!;
              }

              if (sConfirmResult.overduePenalty != null) {
                overduePenalty = sConfirmResult.overduePenalty!;
              }
            }
            setState(() {});
          } else {
            toast(jsonResult.message);
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 375.w,
        height: 960.h,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: (nimg_confirm_bg),
          fit: BoxFit.fill, /* 完全填充*/
        )),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 30.h),
                child: TextView(
                  S.of(context).confirm_loan,
                  size: 18,
                )),
            Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(top: 29.h, left: 25.w),
                child: TextView(
                  S.of(context).order_info,
                  size: 26,
                  color: N.meetD3,
                )),
            Container(
              margin: EdgeInsets.only(top: 14.h),
              padding: EdgeInsets.only(top: 31.h, bottom: 25.h),
              width: 342.w,
              height: 111.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: (nimg_value_bg_confirm),
                fit: BoxFit.fill, /* 完全填充*/
              )),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        child: Column(children: [
                          TextView(
                            S.current.loan_money,
                            size: 12,
                            color: N.black36,
                          ),
                          TextView(loan_amount, size: 35, color: N.red20),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20.w),
                        child: Column(children: [
                          TextView(
                            S.of(context).loan_term,
                            size: 12,
                            color: N.black36,
                          ),
                          TextView("$loan_period ${S.of(context).day}",
                              size: 35, color: N.black33),
                        ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.w, left: 16.w, right: 17.w),
              padding: EdgeInsets.only(
                  top: 20.h, left: 31.w, right: 31.w, bottom: 20.h),
              color: Colors.white,
              child: Column(
                children: [
                  showTextView(S.current.interest, interest),
                  showTextView(S.current.risk, risk),
                  showTextView(S.current.service, service),
                  showTextView(
                    S.current.pay,
                    pay,
                    isShowLine: false,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.w, left: 16.w, right: 17.w),
              padding: EdgeInsets.only(
                  top: 20.h, left: 31.w, right: 31.w, bottom: 20.h),
              color: Colors.white,
              child: Column(
                children: [
                  TextView(
                    S.of(context).comfirm_tip,
                    color: N.black33,
                    size: 12,
                  ),
                  Container(
                    height: 15.h,
                  ),
                  showTextView(
                    S.current.fale_fee,
                    penalty,
                  ),
                  showTextView(
                    S.current.penalty,
                    overduePenalty,
                    isShowLine: false,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.w, left: 16.w, right: 17.w),
              padding: EdgeInsets.only(
                  top: 20.h, left: 31.w, right: 31.w, bottom: 20.h),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    S.of(context).account_Information,
                    color: N.black33,
                    size: 12,
                  ),
                  Container(
                    height: 15.h,
                  ),
                  showTextView(S.current.withdrawal_method, withdrawal_method),
                  showTextView(
                    S.of(context).withdrawal_method_number,
                    withdrawal_method_number,
                    isShowLine: false,
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 30.h),
                child: ButtonView(S.current.next_tip, () {
                  uploadInfo(context);
                  sp_data
                      .get(SPKey.ISREREQUEST.toString(), false)
                      .then((isRequest) {
                    sp_data.get(SPKey.USERID.toString(), "").then((id) {
                      sp_data
                          .get(SPKey.PRODUCTID.toString(), 0)
                          .then((productId) {
                        if (isRequest) {
                          //  直接提交
                          request(UriPath.reloanapp, {
                            "user_id": id,
                            "product_id": productId
                          }).then((value) {
                            var jsonResult = Confirm_result.fromJson(value);
                            if (jsonResult.code == "200") {
                              //print("提交陈宫");
                              var result = jsonResult.result;
                              sp_data
                                  .get(SPKey.PHONE.toString(), "")
                                  .then((value) {
                                if (value.isNotEmpty() &&
                                    result != null &&
                                    result.loanId != null) {
                                  trackCommitLoanSuccessEvent(
                                      value, result.loanId!.toString());
                                }
                              });

                              showSuccessDialog(context);
                            } else {
                              //print("提交失败");
                              toast(jsonResult.message);
                            }
                          });
                        } else {
                          //需要许可

                          sp_data
                              .get(SPKey.lIVENESSID.toString(), "")
                              .then((value) {
                            request(UriPath.loanapp, {
                              "user_id": id,
                              "product_id": productId,
                              "file": value,
                              "method": "advance",
                            }).then((value) {
                              var jsonResult = Confirm_result.fromJson(value);
                              //print("首借提交  $jsonResult");
                              if (jsonResult.code == "200") {
                                //print("提交陈宫");
                                var result = jsonResult.result;
                                sp_data
                                    .get(SPKey.PHONE.toString(), "")
                                    .then((value) {
                                  if (value.isNotEmpty() &&
                                      result != null &&
                                      result.loanId != null) {
                                    trackCommitLoanSuccessEvent(
                                        value, result.loanId!.toString());
                                  }
                                });
                                showSuccessDialog(context);
                              } else {
                                //print("提交失败");
                                toast(jsonResult.message);
                              }
                            });
                          });
                        }
                      });
                    });
                  });
                })),
          ],
        ),
      ),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showSimpleDialog(context, "订单提交成功", nimg_confirm_success, () {
      context.startTo(NHomePage.routeName, isNewTask: true);
    });
  }
}

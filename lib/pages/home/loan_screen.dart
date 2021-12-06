import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/loan_status.dart';
import 'package:philippines_loan/pages/confirm/confirm_page.dart';
import 'package:philippines_loan/pages/repayment/repayment_page.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';

import '../../resource.dart';
import 'package:philippines_loan/utils/slog.dart';

class LoanScreenWidget extends StatefulWidget {
  final LoanstatusResult? loanResult;
  const LoanScreenWidget(this.loanResult, {Key? key,}) : super(key: key);
  @override
  State<LoanScreenWidget> createState() => _LoanScreenWidgetState();
}

class _LoanScreenWidgetState extends State<LoanScreenWidget> {
  var loan_amount_main = "";
  var repayment_date = "";
  var loan_term = "";
  var interest = "";
  var withdrawal_method = "";
  var withdrawal_method_number = "";
  var withdrawal_code = "";
  var amount2Account = "";
  var arrival_status = "";
  var repayment_qr_json = "";

  var day = S.current.day;

bool isShowCode=false;
bool isShowQRCode=false;

  @override
  void initState() {
    super.initState();
    if (widget.loanResult != null) {
      Slog.d("widget.loanResult      ${widget.loanResult}");
      loan_amount_main = widget.loanResult!.principal.toString();
      loan_term = widget.loanResult!.duration.toString();
      withdrawal_method = widget.loanResult!.withdrawalChannel.toString();
      withdrawal_method_number = widget.loanResult!.withdrawalCode.toString();
      amount2Account = widget.loanResult!.amount2Account.toString();
      withdrawal_code = widget.loanResult!.withdrawalCode.toString();
      arrival_status = widget.loanResult!.arrivalStatus.toString();
      repayment_qr_json = widget.loanResult!.repayment_qr_json.toString();


if(arrival_status=="0"){
  isShowCode=false;
  isShowQRCode=false;
}else if (arrival_status=="1"){
  isShowCode=true;
  isShowQRCode=false;
}else if(arrival_status=="2"){
  isShowCode=true;
  isShowQRCode=true;
}



}
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 375.w,
        height: 700.h,
        decoration: BoxDecoration(
          image: DecorationImage(
          image: (nimg_main_loaning_bg),
          fit: BoxFit.fill, /* 完全填充*/
        )),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 30.h),
                child: TextView(
                  PackConfig.appName,
                  size: 18,
                )),
            Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(top: 29.h, left: 25.w),
                child: TextView(
                 S.of(context).loan_str,
                  size: 26,
                  color: N.meetD3,
                )),
            Container(
              margin: EdgeInsets.only(top: 14.h),
              padding: EdgeInsets.only(top: 31.h, bottom: 25.h),
              width: 342.w,
              height: 167.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: (nimg_main_value_bg),
                fit: BoxFit.fill, /* 完全填充*/
              )),
              child: Column(
                children: [
                  TextView(
                   S.of(context).loan_title,
                    color: N.black0C15,
                    size: 16,
                  ),
                  Container(height: 35.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        child: Column(children: [
                          TextView(
                            S.of(context).loan_amount_main,
                            size: 12,
                            color: N.black36,
                          ),
                          TextView(loan_amount_main, size: 35, color: N.red20),
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
                          TextView(loan_term + day, size: 35, color: N.black33),
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
                  showTextView(S.current.withdrawal_method, withdrawal_method),
                  showTextView(S.current.withdrawal_method_number, withdrawal_method_number,),
                  showTextView(S.of(context).amount_arrived, amount2Account, isShowLine: false,),
                ],
              ),
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
                S.of(context).money_tip,
                size: 12,
                color: N.red20,
                textAlign: TextAlign.center,
              ),
            ),

            Stack(children: [
              isShowCode? Container(
                margin: EdgeInsets.only(top: 13.h),
                padding: EdgeInsets.only(top: 13.h, bottom: 13.h,left: 29.w),
                width: 342.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: (nimg_main_loan_value_bottom_bg),
                      fit: BoxFit.fill, /* 完全填充*/
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(S.of(context).withdrawal_digital_code,color: N.black36,textAlign: TextAlign.left,),
                    Container(
                        width: 265.w,
                        height: 33.h,
                        margin: EdgeInsets.only(top: 12.h),
                        child: TextView(withdrawal_code,color: N.black33,size: 23,)),
                  ],
                ),
              ):Container(),
             isShowQRCode? Container(
                  width: 342.w,
                  padding: EdgeInsets.only(top: 13.h, bottom: 13.h,left: 29.w),
                  color: Colors.white,
                  margin: EdgeInsets.only(top:100.h),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(S.of(context).withdrawal_qr,color: N.black36),
                      Container(
                          alignment: Alignment.center,
                          child: Image.network(repayment_qr_json,height: 86.r,width: 86.r,)),
                    ],
                  )
              ):Container(),



            ]),

          ],
        ),
      ),
    );
  }
}

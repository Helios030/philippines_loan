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

class WaitPayScreenWidget extends StatefulWidget {
  final LoanstatusResult? loanResult;

  const WaitPayScreenWidget(
    this.loanResult, {
    Key? key,
  }) : super(key: key);

  @override
  State<WaitPayScreenWidget> createState() => _WaitPayScreenWidgetState();
}

class _WaitPayScreenWidgetState extends State<WaitPayScreenWidget> {
  var loan_amount_main = "";
  var repayment_date = "";
  var loan_term = "";
  var interest = "";
  var withdrawal_method = "";
  var withdrawal_method_number = "";
  var until_date = "";
  var day = S.current.day;


  var isPayAll=false;

  @override
  void initState() {
    super.initState();
    if (widget.loanResult != null) {
      Slog.d("widget.loanResult      ${widget.loanResult}");
      loan_amount_main = widget.loanResult!.principal.toString();
      repayment_date = widget.loanResult!.depositTime.toString();
      loan_term = widget.loanResult!.duration.toString();
      interest = widget.loanResult!.interest.toString();
      withdrawal_method = widget.loanResult!.withdrawalChannel.toString();
      withdrawal_method_number = widget.loanResult!.withdrawalCode.toString();
      DateTime startTime = DateTime.now();
      DateTime endDate = DateTime.parse(repayment_date);
      until_date = endDate.difference(startTime).inDays.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 375.w,
        height: 667.h,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: (nimg_main_wait_pay),
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
                  S.current.repay,
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
                    S.of(context).until_date + until_date + day,
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
                  showTextView(S.of(context).repayment_date, repayment_date),
                  showTextView(S.current.interest, interest),
                  showTextView(S.current.withdrawal_method, withdrawal_method),
                  showTextView(
                    S.current.withdrawal_method_number,
                    withdrawal_method_number,
                    isShowLine: false,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 38.h, left: 26.w, bottom: 18.h, right: 26.w),
              child: Row(
                children: [
                  ButtonView(
                    S.current.sub_pay,
                    () {
                      isPayAll=false;

                      context.startTo(NRePaymentPage.routeName,arg: isPayAll);
                    },
                    size: 156,
                  ),
                  ButtonView(
                    S.current.all_pay,
                    () {
                      isPayAll=true;
                      context.startTo(NRePaymentPage.routeName,arg: isPayAll);
                    },
                    size: 156,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

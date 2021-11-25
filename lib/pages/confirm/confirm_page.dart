import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/loan_status.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/utils/ncolors.dart';

import '../../resource.dart';

class NConfirmPageWidget extends StatelessWidget {
  final LoanstatusResult? loanResult;

  const NConfirmPageWidget(
      this.loanResult, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 375.w,
        height: 951.h,
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
                  "确认贷款",
                  size: 18,
                )),
            Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(top: 29.h, left: 25.w),
                child: TextView(
                  "订单信息",
                  size: 26,
                  color: N.meetD3,
                )),

            Container(
              margin: EdgeInsets.only(top: 14.h),
              padding: EdgeInsets.only(top: 31.h,bottom: 25.h),
              width: 342.w,
              height: 104.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: (nimg_main_value_bg),
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
                          TextView("借款金额",size: 12,color: N.black36,),
                          TextView("5000",size: 35,color: N.red20),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20.w),
                        child: Column(children: [
                          TextView("贷款期限",size: 12,color: N.black36,),
                          TextView("180" + "天",size: 35,color: N.black33),
                        ]),
                      ),
                    ],


                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.w, left: 16.w, right: 17.w),
              padding: EdgeInsets.only(top: 20.h, left: 31.w, right:  31.w,bottom:20.h ),
              color: Colors.white,
              child: Column(
                children: [
                  showTextView("申请日期","2021-07-09"),
                  showTextView("申请日期","2021-07-09"),
                  showTextView("申请日期","2021-07-09"),
                  showTextView("申请日期","2021-07-09",isShowLine: false,), ],
              ),
            ),


            Container(
              margin: EdgeInsets.only(top: 10.w, left: 16.w, right: 17.w),
              padding: EdgeInsets.only(top: 20.h, left: 31.w, right:  31.w,bottom:20.h ),
              color: Colors.white,
              child: Column(
                children: [
                  TextView(" Attention！For late repayment，thebelow fees will be applied.",color: N.black33,size: 12,),
                  Container(height: 15.h,),
                  showTextView("申请日期","2021-07-09"),
                  showTextView("申请日期","2021-07-09",isShowLine: false,), ],
              ),
            ),


            Container(
              margin: EdgeInsets.only(top: 10.w, left: 16.w, right: 17.w),
              padding: EdgeInsets.only(top: 20.h, left: 31.w, right:  31.w,bottom:20.h ),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  TextView("Account Information",color: N.black33,size: 12,),
                  Container(height: 15.h,),
                  showTextView("申请日期","2021-07-09"),
                  showTextView("申请日期","2021-07-09",isShowLine: false,), ],
              ),
            ),



        Container(
            margin: EdgeInsets.only(top: 30.h),
            child: ButtonView(S.current.next_tip,(){})),




          ],
        ),
      ),
    );
  }
}

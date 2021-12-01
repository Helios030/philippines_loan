import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/model/loan_status.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/utils/ncolors.dart';

import '../../resource.dart';

class FailScreenWidget extends StatelessWidget {
  final LoanstatusResult? loanResult;

  const FailScreenWidget(
      this.loanResult, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: (nimg_main_fail_bg),
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
                "审核拒绝",
                size: 26,
                color: N.meetD3,
              )),

          Container(
            margin: EdgeInsets.only(top: 14.h),
            padding: EdgeInsets.only(top: 31.h,bottom: 25.h),
            width: 342.w,
            height: 167.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: (nimg_main_value_bg),
                  fit: BoxFit.fill, /* 完全填充*/
                )),
            child: Column(
              children: [
                TextView("您暂不符合 请保持信用 七天后再申请",color: N.black0C15,size: 16,),
                Container(height:35.h),
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
                        TextView("S.of(context).loan_term",size: 12,color: N.black36,),
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
                showTextView("申请日期","2021-07-09"),
                showTextView("申请日期","2021-07-09",isShowLine: false,),

              ],

            ),

          ),

        ],
      ),
    );
  }
}

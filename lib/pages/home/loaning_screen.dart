import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/loan_status.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/utils/ncolors.dart';

import '../../resource.dart';

class LoaningScreenWidget extends StatelessWidget {
  final LoanstatusResult? loanResult;

  const LoaningScreenWidget(
    this.loanResult, {
    Key? key,
  }) : super(key: key);

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
                  "放款中",
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
                    "您的贷款已经审核通过",
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
                          TextView("5000", size: 35, color: N.red20),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20.w),
                        child: Column(children: [
                          TextView(
                            "S.of(context).loan_term",
                            size: 12,
                            color: N.black36,
                          ),
                          TextView("180" + "天", size: 35, color: N.black33),
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
                  showTextView("申请日期", "2021-07-09"),
                  showTextView(
                    "申请日期",
                    "2021-07-09",
                    isShowLine: false,
                  ),
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
                "Tell the clerk: Money From SkyBridge Payment Inc.",
                size: 12,
                color: N.red20,
                textAlign: TextAlign.center,
              ),
            ),

            //  ======

            Stack(children: [
              Container(
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
                    TextView("取款数字码",color: N.black36,textAlign: TextAlign.left,),
                    Container(
                      width: 265.w,
                        height: 33.h,
                        margin: EdgeInsets.only(top: 12.h),
                        child: TextView("20930293192082932",color: N.black33,size: 23,)),
                  ],
                ),
              ),

              Container(
                  width: 342.w,
                  padding: EdgeInsets.only(top: 13.h, bottom: 13.h,left: 29.w),
                color: Colors.white,
                margin: EdgeInsets.only(top:100.h),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      TextView("取款二维码",color: N.black36),
                      Container(
                          alignment: Alignment.center,
                          child: Image.network("",height: 86.r,width: 86.r,)),
                    ],
                  )



              ),


            ]),
          ],
        ),
      ),
    );
  }
}

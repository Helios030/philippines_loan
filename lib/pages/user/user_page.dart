import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resource.dart';

class NUserPage extends StatelessWidget {
  const NUserPage({Key? key}) : super(key: key);
  static const String routeName = "/user";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(nicon_my_bg),
        fit: BoxFit.fill, /* 完全填充*/
      )),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 42.h, left: 14.w,bottom: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 11.w),
                    width: 42.r,
                    height: 42.r,
                    child: Image(
                      image: AssetImage(nimg_user_icon),
                    )),
                TextView(
                  "039939029",
                  color: N.meetC4,
                  size: 16,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),

          Align(
            child: Column(children: [
              TextView(
                "待还金额",
                color: N.meetC4,
                size: 16,
                textAlign: TextAlign.center,
              ),
              TextView(
                "3000",
                color: N.meetC4,
                size: 42,
                textAlign: TextAlign.center,
              ),
            ],),
          ),

          Container(

            width: double.infinity,
            margin: EdgeInsets.only(top: 12.h, right: 20.w),
            child: TextView(
              "还款日：2021-08-21",
              color: N.meetC4,
              size: 16,
              textAlign: TextAlign.end,
            ),
          ),

          Expanded(
            child:  Container(
                margin: EdgeInsets.only(top: 14.h),
                color: Colors.white,
                child: Column(children: [
                    userItemWidget(S.current.my_loan, nicon_my_loan),
                    userItemWidget(S.current.my_info, nicon_my_user_info),
                    userItemWidget(S.of(context).my_coupon, nicon_my_coupon),
                    Container(height:9.h,color: N.grayF2,),
                    userItemWidget(S.current.about_us, nicon_my_about),
                    userItemWidget(S.current.my_call, nicon_my_user_call),
                    userItemWidget(S.current.my_exit, nicon_my_exit),
                    Expanded(child: Container(height:9.h,color: N.grayF2,)),

                  ],),

              ),

          ),
        ],
      ),
    ));
  }
}

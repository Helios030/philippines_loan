
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/utils/ncolors.dart';

import '../../resource.dart';


var rePaymentDataMap = <String, dynamic>{};

class NRePaymentPage extends StatefulWidget {
  const NRePaymentPage({Key? key}) : super(key: key);
  static const String routeName = "/repayment";

  @override
  State<NRePaymentPage> createState() => _NRePaymentPageState();
}

class _NRePaymentPageState extends State<NRePaymentPage> {

  var isPayAll=false;



  @override
  Widget build(BuildContext context) {

    var title=isPayAll?S.current.all_pay:S.current.sub_pay;

    return SingleChildScrollView(
      child: Container(
        width: 375.w,
        height: 700.h,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: (nicon_my_bg),
              fit: BoxFit.fill, /* 完全填充*/
            )),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 30.h),
                child: TextView(title, size: 18,)),

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
                  TextView(S.current.amount_repaid,color: N.black36,),
                  Center(child: TextView("1000.89",color: N.red20,size: 40,)),

                ],
              ),
            ),

           isPayAll?Container(): Container(
              margin: EdgeInsets.only(top: 16.h,bottom: 16.h),
              padding: EdgeInsets.only(left: 31.w, top: 20.h,right: 31.w,bottom: 20.h),
              width: 342.w,
              height: 104.h,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(4.0),
               color: Colors.white,),
              child: Column(
                children: [

                  showTextView(
                    S.current.start_time,
                    "2021-12-01",

                  ),


                  showTextView(
                    S.current.end_time,
                    "2021-12-01",
                    isShowLine: false,
                  ),

                ],
              ),
            ),







          ],
        ),
      ),
    );
  }
}
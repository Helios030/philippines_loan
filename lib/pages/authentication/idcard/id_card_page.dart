import 'package:flutter/material.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/pages/authentication/userinfo/user_info_page.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../resource.dart';
import 'package:philippines_loan/utils/expand_util.dart';


class NIdCardPage extends StatefulWidget {
  static const String routeName = "/id_card";

  const NIdCardPage({Key? key}) : super(key: key);

  @override
  _NIdCardPageState createState() => _NIdCardPageState();
}

class _NIdCardPageState extends State<NIdCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Column(
        children: [
          AppBarWidget("认证"),

          Container(
              width: 272.w,
              height: 174.h,
              child: Image(image: nimg_upload_id)),
          Container(
              width: 304.w,
              margin: EdgeInsets.only(top: 19.h,bottom: 40.h),
              child: TextView("* Please ensure the ID uploaded matches with the ID Type previously selected.",color: N.black36,textAlign: TextAlign.center,)),

          Container(
              width: 272.w,
              height: 174.h,
              child: Image(image: nimg_upload_work)),

          Container(height: 19.h,),

          TextView("请拍摄工作证明(或以下其一)",color: N.black36,),
        Container(height: 19.h,),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            TextView("1. 工资单 ",color: N.gray9B),
            TextView("2. 工作证 ",color: N.gray9B,),
            TextView("3. 驾驶执照（摩托车/汽车）",color: N.gray9B,),
            TextView("4. 工作场所照片",color: N.gray9B,)

          ],),

          Container(height: 25.h,),




          ButtonView(S.current.next_tip,(){

            context.startTo(NUserInfoWidget.routeName);
          }),





          Container(height: 46.h,),

        ],
      ),
    ),);
  }
}

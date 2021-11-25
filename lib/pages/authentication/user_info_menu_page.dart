import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/pages/authentication/card/card_info_page.dart';
import 'package:philippines_loan/pages/authentication/contact/contact_info_page.dart';
import 'package:philippines_loan/pages/authentication/userinfo/user_info_page.dart';
import 'package:philippines_loan/pages/authentication/work/work_info_page.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/utils/expand_util.dart';

import '../../resource.dart';

class NUserInfoMenuPager extends StatelessWidget {
  static String routeName = "/user_info_menu";

  const NUserInfoMenuPager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(S.current.my_info),
          Container(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //横轴三个子widget
                    childAspectRatio: 1.0 //宽高比为1时，子widget
                    ),
                children: <Widget>[
                  getMenuItem(S.current.user_info, nimg_user_info,(){context.startTo(NUserInfoWidget.routeName);}),
                  getMenuItem(S.current.contact_info, nimg_usercontact,(){context.startTo(NContactInfoWidget.routeName);}),
                  getMenuItem(S.current.work_info, nimg_work_info,(){context.startTo(NWorkInfoWidget.routeName);}),
                  getMenuItem(S.current.card_info, nimg_card_bank,(){context.startTo(NCardInfoWidget.routeName);}),
                ]),
          ),
        ],
      ),
    );
  }

  Widget getMenuItem(String title, ImageProvider img,GestureTapCallback? onClick) {
    return GestureDetector(
      onTap:onClick,
      child: Container(
        margin: EdgeInsets.all(10.r),
        padding: EdgeInsets.only(left: 20.w, top: 16.h),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: (img),
          fit: BoxFit.fill, /* 完全填充*/
        )),
        child: TextView(title,size: 17,color: Colors.white,),
      ),
    );
  }
}

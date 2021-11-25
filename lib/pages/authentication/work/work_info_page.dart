import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/pages/authentication/card/card_info_page.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/edit_view.dart';
import 'package:philippines_loan/pages/widgets/item_text_view.dart';
import 'package:philippines_loan/utils/expand_util.dart';

import '../../../resource.dart';


var workDataMap = <String, dynamic>{};

class NWorkInfoWidget extends StatelessWidget {
  static String routeName = "/work_info";

  const NWorkInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBarWidget(S.current.my_info),
          Container(
              margin: EdgeInsets.only(bottom: 31.h),
              height: 58.h,
              width: 375.w,
              child: Image(
                image: nimg_progress_tree,
                fit: BoxFit.fill,
              )),
          Container(
              margin: EdgeInsets.only(left: 18.w, right: 18.w),
              child: Column(children: [

                ItemTextView(S.current.birthday, "1993-09-13"),
                ItemTextView(S.current.birthday, "1993-09-13"),
                ItemTextView(S.current.birthday, "1993-09-13"),
                ItemTextView(S.current.birthday, "1993-09-13"),
                EditTextView(S.current.nick_name, (text) {},
                    TextEditingController(text: "zhangsan")),

                ItemTextView(S.current.home_city, "1993-09-13"),
                ItemTextView("", "1993-09-13"),
                ItemTextView("", "1993-09-13"),

                EditTextView(S.current.nick_name, (text) {},
                    TextEditingController(text: "zhangsan")),







                ButtonView(S.current.next_tip, () {
                  context.startTo(NCardInfoWidget.routeName);
                }),
                Container(
                  height: 25.h,
                ),
              ]))
        ],
      ),
    );
  }
}
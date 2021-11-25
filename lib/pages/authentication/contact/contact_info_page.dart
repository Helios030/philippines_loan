import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/pages/authentication/work/work_info_page.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/item_text_view.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';

import '../../../resource.dart';

var contactDataMap = <String, dynamic>{};

class NContactInfoWidget extends StatefulWidget {
  static String routeName = "/contact_info";

  const NContactInfoWidget({Key? key}) : super(key: key);

  @override
  State<NContactInfoWidget> createState() => _NContactInfoWidgetState();
}

class _NContactInfoWidgetState extends State<NContactInfoWidget> {
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
                image: nimg_progress_t,
                fit: BoxFit.fill,
              )),
          Container(
              margin: EdgeInsets.only(left: 18.w, right: 18.w),
              child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                TextView(
                  "第一联系人",
                  color: N.orange37,
                  textAlign: TextAlign.left,
                ),
                ItemTextView(S.current.birthday, "1993-09-13"),
                ItemTextView(S.current.birthday, "1993-09-13"),
                ItemTextView(S.current.birthday, "1993-09-13"),
                Container(height: 27.h,),

                TextView(
                  "第一联系人",
                  color: N.orange37,
                ),
                ItemTextView(S.current.birthday, "1993-09-13"),
                ItemTextView(S.current.birthday, "1993-09-13"),
                ItemTextView(S.current.birthday, "1993-09-13"),

                    Container(height: 27.h,),

                TextView(
                  "第一联系人",
                  color: N.orange37,
                ),
                ItemTextView(S.current.birthday, "1993-09-13"),
                ItemTextView(S.current.birthday, "1993-09-13"),
                ItemTextView(S.current.birthday, "1993-09-13"),

                    Container(height: 27.h,),

                TextView(
                  "第一联系人",
                  color: N.orange37,
                ),
                ItemTextView(S.current.birthday, "1993-09-13"),
                ItemTextView(S.current.birthday, "1993-09-13"),
                ItemTextView(S.current.birthday, "1993-09-13"),

                    Container(height: 27.h,),
                TextView(
                  "第一联系人",
                  color: N.orange37,
                ),
                ItemTextView(S.current.birthday, "1993-09-13"),
                ItemTextView(S.current.birthday, "1993-09-13"),
                ItemTextView(S.current.birthday, "1993-09-13"),
                    Container(height: 43.h,),
                ButtonView(S.current.next_tip, () {
                  context.startTo(NWorkInfoWidget.routeName);
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

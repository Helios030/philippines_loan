import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/pages/authentication/contact/contact_info_page.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/edit_view.dart';
import 'package:philippines_loan/pages/widgets/item_text_view.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/resource.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/utils/expand_util.dart';


var userDataMap = <String, dynamic>{};

class NUserInfoWidget extends StatelessWidget {
  static String routeName = "/user_info";

  const NUserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            AppBarWidget(S.current.my_info),
            Container(
                margin: EdgeInsets.only(bottom: 12.h),
                height: 58.h,
                width: 375.w,
                child: Image(
                  image: nimg_progress_o,
                  fit: BoxFit.fill,
                )),
            Container(
              margin: EdgeInsets.only(left: 18.w, right: 18.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // TextView("zhangsn "),
                      Container(
                          width: 100.w,
                          height: 70.h,
                          child: EditTextView("First name", (text) {},
                              TextEditingController(text: "test"))),
                      Container(
                          width: 100.w,
                          height: 70.h,
                          child: EditTextView("Middle name", (text) {},
                              TextEditingController(text: "test"))),
                      Container(
                          width: 100.w,
                          height: 70.h,
                          child: EditTextView("Last name", (text) {},
                              TextEditingController(text: "test"))),
                    ],
                  ),
                  ItemTextView(S.current.birthday, "1993-09-13"),
                  ItemTextView("ID Type", "PassPort"),
                  EditTextView(
                      "ID No",
                      (text) {},
                      TextEditingController(
                          text: "12345334536")),
                  EditTextView(S.current.nick_name, (text) {},
                      TextEditingController(text: "zhangsan")),
                  ItemTextView(S.current.gender, "1993-09-13"),
                  ItemTextView("宗教", "宗教"),
                  ItemTextView(S.current.education, "学历"),
                  ItemTextView(S.current.marriage, "1993-09-13"),
                  ItemTextView(S.current.how_children, "1993-09-13"),
                  ItemTextView(S.current.home_city, "1993-09-13"),
                  ItemTextView("", "1993-09-13"),
                  ItemTextView("", "1993-09-13"),
                  EditTextView(S.current.detail_address, (text) {}, TextEditingController(text: "")),
                  ItemTextView("位置", "1993-09-13"),
                  ItemTextView(S.current.home_time, "1993-09-13"),
                  EditTextView(S.current.email, (text) {}, TextEditingController(text: "zhangsan")),
                  ButtonView(S.current.next_tip, () {


                    context.startTo(NContactInfoWidget.routeName);

                  }),
                  Container(
                    height: 25.h,
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

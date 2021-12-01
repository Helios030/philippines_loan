import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/city.dart';
import 'package:philippines_loan/pages/authentication/card/card_info_page.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/edit_view.dart';
import 'package:philippines_loan/pages/widgets/item_text_view.dart';
import 'package:philippines_loan/utils/dictionary_util.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';

import '../../../resource.dart';


var workDataMap = <String, dynamic>{};

CityResult? sCity1;
CityResult? sCity2;
CityResult? sCity3;


class NWorkInfoWidget extends StatefulWidget {
  static String routeName = "/work_info";

  const NWorkInfoWidget({Key? key}) : super(key: key);

  @override
  State<NWorkInfoWidget> createState() => _NWorkInfoWidgetState();
}

class _NWorkInfoWidgetState extends State<NWorkInfoWidget> {


  var compNameCTL = TextEditingController();
  var detailAddressCTL = TextEditingController();
  var compPhoneCTL = TextEditingController();

  var select_job = S.current.select_job;
  var select_job_type = S.current.select_job_type;
  var select_industry = S.current.select_industry;
  var select_salary_range = S.current.select_salary_range;
  var select_comp_address = S.current.select_comp_address;


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

                ItemTextView(S.current.job, select_job,
                    onSelected: (menu) {
                      workDataMap['position'] = menu.menuCode;
                      select_job = menu.menuName;
                    }, datas: DicUtil.array_company_position),




                ItemTextView(S.current.job_type, select_job_type,
                    onSelected: (menu) {
                      workDataMap['custemer_type'] = menu.menuCode;
                      select_job_type = menu.menuName;
                    }, datas: DicUtil.array_job_type),
                ItemTextView(S.current.industry, select_industry,
                    onSelected: (menu) {
                      workDataMap['industry'] = menu.menuCode;
                      select_industry = menu.menuName;
                    }, datas: DicUtil.array_industry),
                ItemTextView(S.current.salary_range, select_salary_range,
                    onSelected: (menu) {
                      workDataMap['income_type'] = menu.menuCode;
                      select_salary_range = menu.menuName;
                    }, datas: DicUtil.array_company_position),
              EditTextView(S.current.comp_name, (text) {workDataMap['company_name'] = text;}, compNameCTL),
                NCitySelectWidget(),
                EditTextView(S.current.detail_address, (text) {workDataMap['comp_address'] = text;}, detailAddressCTL),
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

class NCitySelectWidget extends StatefulWidget {
  const NCitySelectWidget({Key? key}) : super(key: key);

  @override
  _NCitySelectWidgetState createState() => _NCitySelectWidgetState();
}

class _NCitySelectWidgetState extends State<NCitySelectWidget> {

  var select_province=S.current.select_province;
  var select_county=S.current.select_county;
  var select_street=S.current.select_street;
  var color1 = N.gray1A;
  var color2 = N.gray1A;
  var color3 = N.gray1A;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ItemTextView(
        S.current.comp_address,
        select_province,
        onCity: (city) {
          sCity1 = city;
          select_province=city.addressName.toString();
          color1 = N.black33;
          setState(() {});
        },vColor: color1,
      ),
      ItemTextView(
        "",
        select_county,
        onCity: (city) {
          sCity2 = city;
          select_county=city.addressName.toString();
          color2 = N.black33;
          setState(() {

          });
        },vColor: color2,
        cityId: sCity1?.addressNo.toString(),
      ),
      ItemTextView(
        "",
        select_street,
        onCity: (city) {
          sCity3 = city;
          select_street=city.addressName.toString();
          color3 = N.black33;
          setState(() {

          });
        },vColor: color3,
        cityId: sCity2?.addressNo.toString(),
      ),
    ],);
  }
}



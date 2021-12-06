import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/city.dart';
import 'package:philippines_loan/model/empty_result.dart';
import 'package:philippines_loan/model/s_work_info_result.dart';
import 'package:philippines_loan/pages/authentication/card/card_info_page.dart';
import 'package:philippines_loan/pages/authentication/userinfo/user_info_page.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/edit_view.dart';
import 'package:philippines_loan/pages/widgets/item_text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/dictionary_util.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'package:philippines_loan/utils/sp_key.dart';
import 'package:philippines_loan/utils/utils.dart';
import '../../../resource.dart';
import 'package:philippines_loan/utils/sp_data.dart';

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
  var compTelCTL = TextEditingController();
  var compPhoneCTL = TextEditingController();

  var select_job = S.current.select_job;
  var select_job_type = S.current.select_job_type;
  var select_industry = S.current.select_industry;
  var select_salary_range = S.current.select_salary_range;
  var select_comp_address = S.current.select_comp_address;

  SWorkInfoResult? sWorkInfo = null;

  @override
  void initState() {
    super.initState();
    //  获取服务器保存数据
    SPData.get(SPKey.USERID.toString(), "").then((id) {
      Map<String, dynamic> dataMap = {};
      dataMap["user_id"] = id;
      request(UriPath.queryUserwork, dataMap).then((value) {
        workDataMap["user_id"] = id;
        var s_work_info_result = S_work_info_result.fromJson(value);
        if (s_work_info_result.code == "200") {
          sWorkInfo = s_work_info_result.result;
          //print("工作返回结果  $sWorkInfo");
          setMapForResult(sWorkInfo);
          setState(() {});
        } else {
          toast(s_work_info_result.message);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (sWorkInfo != null) {
      if (sWorkInfo!.companyName.isNotNull()) {
        compNameCTL = getCTL(sWorkInfo!.companyName!);
      }

      if (sWorkInfo!.compAddress.isNotNull()) {
        detailAddressCTL = getCTL(sWorkInfo!.compAddress!);
      }
      if (sWorkInfo!.companyTel.isNotNull()) {
        compPhoneCTL = getCTL(sWorkInfo!.companyTel!);
      }

      if (sWorkInfo!.position.isNotNull()) {
        select_job = DicUtil
            .array_company_position[getIndex(sWorkInfo!.position!)].menuName;
      }

      if (sWorkInfo!.custemerType.isNotNull()) {
        select_job_type =
            DicUtil.array_job_type[getIndex(sWorkInfo!.custemerType!)].menuName;
      }

      if (sWorkInfo!.industry.isNotNull()) {
        select_industry = DicUtil
            .array_industry[getIndex(sWorkInfo!.industry!, offset: 50)]
            .menuName;
      }

      if (sWorkInfo!.incomeType.isNotNull()) {
        select_salary_range = DicUtil
            .array_monthly_income_type[getIndex(sWorkInfo!.incomeType!)]
            .menuName;
      }
      if (sWorkInfo!.compRegion1Value.isNotNull() &&
          sWorkInfo!.compRegion2Value.isNotNull()) {
        select_comp_address =
            "${sWorkInfo!.compRegion1Value} ${sWorkInfo!.compRegion2Value}";
      }
    }

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
                ItemTextView(S.current.job, select_job, onSelected: (menu) {
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
                EditTextView(S.current.comp_name, (text) {
                  workDataMap['company_name'] = text;
                }, compNameCTL),
                NCitySelectWidget(sWorkInfo),
                EditTextView(S.current.detail_address, (text) {
                  workDataMap['comp_address'] = text;
                }, detailAddressCTL),


                EditTextView(S.current.comp_phone, (text) {
                  workDataMap['company_tel'] = text;
                }, compTelCTL),

                ButtonView(S.current.next_tip, () {
                  request(UriPath.userWork, workDataMap).then((value) {
                    var result = EmptyReslut.fromJson(value);
                    if (result.isSuccess()) {
                      //print("工作上传成功");
                      Navigator.pop(context);
                      context.startTo(NCardInfoWidget.routeName);
                    } else {
                      toast(result.message);
                      printLog("上传失败  == $result ", StackTrace.current);
                    }
                  });
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

void setMapForResult(SWorkInfoResult? it) {
  if (it != null) {
    workDataMap["pay_type"] = "1";
    workDataMap["company_name"] = it.companyName;
    workDataMap["comp_address"] = it.compAddress;
    workDataMap["company_tel"] = it.companyTel;
    workDataMap["position"] = it.position;
    workDataMap["custemer_type"] = it.custemerType;
    workDataMap["industry"] = it.industry;
    workDataMap["income_type"] = it.incomeType;
    workDataMap["comp_region_1"] = it.compRegion1;
    workDataMap["comp_region_2"] = it.compRegion2;
    workDataMap["comp_region_3"] = it.compRegion3;
  }
}

class NCitySelectWidget extends StatefulWidget {
  SWorkInfoResult? sUserInfo = null;

  NCitySelectWidget(this.sUserInfo, {Key? key}) : super(key: key);

  @override
  _NCitySelectWidgetState createState() => _NCitySelectWidgetState();
}

class _NCitySelectWidgetState extends State<NCitySelectWidget> {
  var select_province = S.current.select_province;
  var select_county = S.current.select_county;
  var select_street = S.current.select_street;
  var color1 = N.gray1A;
  var color2 = N.gray1A;
  var color3 = N.gray1A;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sUserInfo!.compRegion1Value.isNotNull()) {
      select_province = widget.sUserInfo!.compRegion1Value.toString();
    }
    if (widget.sUserInfo!.compRegion2Value.isNotNull()) {
      select_county = widget.sUserInfo!.compRegion2Value.toString();
    }
    if (widget.sUserInfo!.compRegion3Value.isNotNull()) {
      select_street = widget.sUserInfo!.compRegion3Value.toString();
    }

    return Column(
      children: [
        ItemTextView(
          S.current.comp_address,
          select_province,
          onCity: (city) {
            sCity1 = city;
            select_province = city.addressName.toString();
            color1 = N.black33;
            workDataMap["comp_region_1"] = city.addressNo;

            setState(() {});
          },
          vColor: color1,
        ),
        ItemTextView(
          "",
          select_county,
          onCity: (city) {
            sCity2 = city;
            select_county = city.addressName.toString();
            color2 = N.black33;
            workDataMap["comp_region_2"] = city.addressNo;

            setState(() {});
          },
          vColor: color2,
          cityId: sCity1?.addressNo.toString(),
        ),
        ItemTextView(
          "",
          select_street,
          onCity: (city) {
            sCity3 = city;
            select_street = city.addressName.toString();
            color3 = N.black33;
            workDataMap["comp_region_3"] = city.addressNo;
            setState(() {});
          },
          vColor: color3,
          cityId: sCity2?.addressNo.toString(),
        ),
      ],
    );
  }
}

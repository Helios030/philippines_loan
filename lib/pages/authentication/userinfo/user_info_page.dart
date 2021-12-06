import 'package:flutter/material.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/city.dart';
import 'package:philippines_loan/model/empty_result.dart';
import 'package:philippines_loan/model/s_user_info_result.dart';
import 'package:philippines_loan/pages/authentication/contact/contact_info_page.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/edit_view.dart';
import 'package:philippines_loan/pages/widgets/item_text_view.dart';
import 'package:philippines_loan/pages/widgets/pop_city_view.dart';
import 'package:philippines_loan/resource.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/dictionary_util.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/sp_key.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:philippines_loan/utils/slog.dart';

var userDataMap = <String, dynamic>{};

CityResult? sCity1;
CityResult? sCity2;
CityResult? sCity3;

class NUserInfoWidget extends StatefulWidget {
  static String routeName = "/user_info";

  const NUserInfoWidget({Key? key}) : super(key: key);

  @override
  State<NUserInfoWidget> createState() => _NUserInfoWidgetState();
}

class _NUserInfoWidgetState extends State<NUserInfoWidget> {
  SUserInfoResult? sUserInfo = null;

  var fNameCTL = TextEditingController(text: "");
  var mNameCTL = TextEditingController(text: "");
  var lastNameCTL = TextEditingController(text: "");
  var nNameCTL = TextEditingController(text: "");
  var idNumberCTL = TextEditingController(text: "");
  var detailAddressCTL = TextEditingController(text: "");
  var emailCTL = TextEditingController(text: "");

  var birthday = S.current.please_check;
  var gender = S.current.please_check;
  var education = S.current.please_check;
  var marital_status = S.current.please_check;
  var how_children = S.current.please_check;
  var province_city = S.current.please_check;
  var home_time = S.current.please_check;
  var id_type = S.current.please_check;
  var religion = S.current.please_check;
  var location = S.current.get_location;

  var home_religion_1 = S.current.please_check;
  var home_religion_2 = S.current.please_check;
  var home_religion_3 = S.current.please_check;

  @override
  void initState() {
    super.initState();
    SPData.get(SPKey.USERID.toString(), "").then((id) {
      Map<String, dynamic> dataMap = {};
      dataMap["user_id"] = id;
      userDataMap["user_id"] = id;
      request(UriPath.queryUserBase, dataMap).then((value) {
        var s_user_info_result = S_user_info_result.fromJson(value);
        if (s_user_info_result.code == "200") {
          Slog.d("JsonResult 返回结果  $sUserInfo");
          sUserInfo = s_user_info_result.result;
          Slog.d("返回结果  $sUserInfo");
          setMapForResult(sUserInfo);
          setState(() {});
        } else {
          toast(s_user_info_result.message);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //获取服务器保存内容 需要每次编译获取服务器的值
    if (sUserInfo != null) {
      if (sUserInfo!.noKtp != null) {
        idNumberCTL = getCTL(sUserInfo!.noKtp!);
      }
      if (sUserInfo!.firstName != null) {
        fNameCTL = getCTL(sUserInfo!.firstName!);
      }
      if (sUserInfo!.middleName != null) {
        mNameCTL = getCTL(sUserInfo!.middleName!);
      }
      if (sUserInfo!.lastName != null) {
        lastNameCTL = getCTL(sUserInfo!.lastName!);
      }
      if (sUserInfo!.birthday != null) {
        birthday = sUserInfo!.birthday!;
      }
      if (sUserInfo!.gender != null) {
        //服务器从1开始
        gender = DicUtil.array_genders[getIndex(sUserInfo!.gender!)].menuName;
      }

      if (sUserInfo!.nameMother != null) {
        nNameCTL = getCTL(sUserInfo!.nameMother!);
      }
      if (sUserInfo!.homeAddress != null) {
        detailAddressCTL = getCTL(sUserInfo!.homeAddress!);
      }

      if (sUserInfo!.email != null) {
        emailCTL = getCTL(sUserInfo!.email!);
      }

      if (sUserInfo!.duraOccupancy != null) {
        home_time = DicUtil
            .array_home_ttime[getIndex(sUserInfo!.duraOccupancy!)].menuName;
      }
      if (sUserInfo!.education != null) {
        education = DicUtil
            .array_education_level[getIndex(sUserInfo!.education!)].menuName;
      }
      if (sUserInfo!.maritalStatus != null) {
        marital_status = DicUtil
            .array_marital_status[getIndex(sUserInfo!.maritalStatus!)].menuName;
      }
      if (sUserInfo!.numberChildren != null) {
        how_children = DicUtil
            .array_children_num[getIndex(sUserInfo!.numberChildren!)].menuName;
      }

      if (sUserInfo!.idType != null) {
        id_type = DicUtil.array_idTypes[getIndex(sUserInfo!.idType!)].menuName;
      }

      if (sUserInfo!.religion != null) {
        religion =
            DicUtil.array_religions[getIndex(sUserInfo!.religion!)].menuName;
      }
    }

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
                      Container(
                          width: 100.w,
                          height: 70.h,
                          child: EditTextView("First name", (text) {
                            userDataMap['first_name'] = text;
                          }, fNameCTL)),
                      Container(
                          width: 100.w,
                          height: 70.h,
                          child: EditTextView("Middle name", (text) {
                            userDataMap['middle_name'] = text;
                          }, mNameCTL)),
                      Container(
                          width: 100.w,
                          height: 70.h,
                          child: EditTextView("Last name", (text) {
                            userDataMap['last_name'] = text;
                          }, lastNameCTL)),
                    ],
                  ),
                  ItemTextView(
                    S.current.birthday,
                    birthday,
                    onBirthday: (text) {
                      birthday = text;
                      userDataMap["birthday"] = text;
                    },
                  ),
                  ItemTextView("ID Type", id_type, onSelected: (menu) {
                    userDataMap['idType'] = menu.menuCode;
                    education = menu.menuName;
                  }, datas: DicUtil.array_idTypes),
                  EditTextView("ID No", (text) {
                    userDataMap['no_ktp'] = text;
                  }, idNumberCTL),
                  EditTextView(S.current.nick_name, (text) {}, nNameCTL),
                  ItemTextView(
                    S.of(context).gender,
                    gender,
                    onSelected: (menu) {
                      userDataMap['gender'] = menu.menuCode;
                    },
                    datas: DicUtil.array_genders,
                  ),
                  ItemTextView(S.of(context).religion, religion,
                      onSelected: (menu) {
                    userDataMap['religion'] = menu.menuCode;
                    education = menu.menuName;
                  }, datas: DicUtil.array_religions),
                  ItemTextView(S.current.education, education,
                      onSelected: (menu) {
                    userDataMap['education'] = menu.menuCode;
                    education = menu.menuName;
                  }, datas: DicUtil.array_education_level),
                  ItemTextView(
                    S.current.marriage,
                    marital_status,
                    onSelected: (menu) {
                      userDataMap["marital_status"] = menu.menuCode;
                      marital_status = menu.menuName;
                    },
                    datas: DicUtil.array_marital_status,
                  ),
                  ItemTextView(
                    S.current.how_children,
                    how_children,
                    onSelected: (menu) {
                      userDataMap['number_children'] = menu.menuCode;
                      how_children = menu.menuName;
                    },
                    datas: DicUtil.array_children_num,
                  ),
                  NCitySelectWidget(sUserInfo),
                  EditTextView(
                    S.of(context).details_address,
                    (value) {
                      userDataMap["home_address"] = value;
                      detailAddressCTL = getCTL(value);
                    },
                    detailAddressCTL,
                  ),
                  ItemTextView(
                    S.of(context).location,
                    location,
                    itemIcon: nicon_location,
                    onLocation: (locationStr) {
                      Slog.d("点击事件   ");
                      location = locationStr;
                    },
                  ),
                  ItemTextView(
                    S.current.home_time,
                    home_time,
                    onSelected: (menu) {
                      userDataMap['dura_occupancy'] = menu.menuCode;
                      home_time = menu.menuName;
                    },
                    datas: DicUtil.array_home_ttime,
                  ),
                  EditTextView(
                    S.current.email,
                    (value) {
                      userDataMap["email"] = value;
                      emailCTL = getCTL(value);
                    },
                    emailCTL,
                  ),
                  ButtonView(S.current.next_tip, () {
                    request(UriPath.userBase, userDataMap)
                         .then((value) {
                       var result = EmptyReslut.fromJson(value);
                       if (result.isSuccess()) {
                         //    Slog.d(" 个人信息上传成功  ");

                         Navigator.pop(context);
                    context.startTo(NContactInfoWidget.routeName);
                      } else {
                        toast(result.message);
                        printLog("上传失败  == $result ", StackTrace.current);
                      }
                    });
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

  void setMapForResult(SUserInfoResult? it) {
    if (it != null) {
      userDataMap["home_type"] = it.homeType;
      userDataMap["home_address"] = it.homeAddress;
      userDataMap["home_region_1"] = it.homeRegion1;
      userDataMap["home_region_2"] = it.homeRegion2;
      userDataMap["home_region_3"] = it.homeRegion3;
      userDataMap["education"] = it.education;
      userDataMap["marital_status"] = it.maritalStatus;
      userDataMap["number_children"] = it.numberChildren;
      userDataMap["no_ktp"] = it.noKtp;
      userDataMap["idType"] = it.idType;
      userDataMap["first_name"] = it.firstName;
      userDataMap["middle_name"] = it.middleName;
      userDataMap["last_name"] = it.lastName;
      userDataMap["user_id"] = it.userId;
      userDataMap["birthday"] = it.birthday;
      userDataMap["gender"] = it.gender;
      userDataMap["name_mother"] = it.nameMother;
      userDataMap["email"] = it.email;
      userDataMap["line"] = it.line;
      userDataMap["facebook"] = it.facebook;
      userDataMap["religion"] = it.religion;
    }
  }
}

class NCitySelectWidget extends StatefulWidget {
  SUserInfoResult? sUserInfo = null;

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
    // if(widget.sUserInfo!=null){
    //   if (widget.sUserInfo!.homeRegion1Value!=null) {select_province=widget.sUserInfo!.homeRegion1Value.toString();}
    //   if (widget.sUserInfo!.homeRegion2Value!=null) {select_county=widget.sUserInfo!.homeRegion2Value.toString();}
    //   if (widget.sUserInfo!.homeRegion3Value!=null) {select_street=widget.sUserInfo!.homeRegion3Value.toString();}
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTextView(
          S.current.home_city,
          select_province,
          onCity: (city) {
            sCity1 = city;
            select_province = city.addressName.toString();
            color1 = N.black33;

            userDataMap["home_region_1"] = city.addressNo;

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
            userDataMap["home_region_2"] = city.addressNo;
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
            userDataMap["home_region_3"] = city.addressNo;
            setState(() {});
          },
          vColor: color3,
          cityId: sCity2?.addressNo.toString(),
        ),
      ],
    );
  }
}

int getIndex(String value, {int offset = 1}) {
  int index = 0;
  try {
    index = int.parse(value) - offset;
    if (index < 0) {
      index = 0;
    }
  } catch (e) {
    //    Slog.d(" Error: " + value);
  }
  return index;
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/empty_result.dart';
import 'package:philippines_loan/model/s_contact_result.dart';
import 'package:philippines_loan/pages/authentication/card/card_info_page.dart';
import 'package:philippines_loan/pages/authentication/work/work_info_page.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/item_text_view.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/dictionary_util.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/sp_key.dart';

import '../../../resource.dart';

var contactDataMap = <String, dynamic>{};

class NContactInfoWidget extends StatefulWidget {
  static String routeName = "/contact_info";

  const NContactInfoWidget({Key? key}) : super(key: key);

  @override
  State<NContactInfoWidget> createState() => _NContactInfoWidgetState();
}

class _NContactInfoWidgetState extends State<NContactInfoWidget> {
  SContactResult? sContactInfo;
  String first_name = S.current.please_check;
  String first_phone = S.current.please_check;

  String second_name = S.current.please_check;
  String second_phone = S.current.please_check;
  String relation_1 = S.current.please_check;
  String relation_2 = S.current.please_check;
  String relation_3 = S.current.please_check;
  String relation_4 = S.current.please_check;
  String relation_5 = S.current.please_check;
  String name_3 = S.current.please_check;
  String name_4 = S.current.please_check;
  String name_5 = S.current.please_check;
  String phone_3 = S.current.please_check;
  String phone_4 = S.current.please_check;
  String phone_5 = S.current.please_check;


  Color color_1=N.gray1A;
  Color color_2=N.gray1A;
  Color color_3=N.gray1A;
  Color color_4=N.gray1A;
  Color color_5=N.gray1A;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print("initState ============== ");
    sp_data.get(SPKey.USERID.toString(), "").then((id) {
      Map<String, dynamic> dataMap = {};
      dataMap["user_id"] = id;
      contactDataMap["user_id"] = id;
      request(UriPath.queryUserContact, dataMap).then((value) {
        var s_contact_result = S_contact_result.fromJson(value);
        if (s_contact_result.code == "200") {
          sContactInfo = s_contact_result.result;
          slog.d("联系人返回结果  $sContactInfo");
          setMapForResult(sContactInfo);

          if (sContactInfo != null) {
            if (sContactInfo!.nameRelation1 != null) {
              first_name = sContactInfo!.nameRelation1!;
            }
            if (sContactInfo!.phoneRelation1 != null) {
              first_phone = sContactInfo!.phoneRelation1!;
            }
            if (sContactInfo!.nameRelation2 != null) {
              second_name = sContactInfo!.nameRelation2!;
            }
            if (sContactInfo!.phoneRelation2 != null) {
              second_phone = sContactInfo!.phoneRelation2!;
            }

            if (sContactInfo!.relation1 != null) {
              //服务器从1开始
              relation_1 = DicUtil
                  .array_first_contact[int.parse(sContactInfo!.relation1!) - 1]
                  .menuName;
            }
            if (sContactInfo!.relation2 != null) {
              //服务器从1开始
              relation_2 = DicUtil
                  .array_second_contact[int.parse(sContactInfo!.relation2!) - 1]
                  .menuName;
            }

            if (sContactInfo!.phoneRelation3 != null) {
              phone_3 = sContactInfo!.phoneRelation3!;
            }
            if (sContactInfo!.phoneRelation4 != null) {
              phone_4 = sContactInfo!.phoneRelation4!;
            }
            if (sContactInfo!.phoneRelation5 != null) {
              phone_5 = sContactInfo!.phoneRelation5!;
            }
            if (sContactInfo!.nameRelation3 != null) {
              name_3 = sContactInfo!.nameRelation3!;
            }
            if (sContactInfo!.nameRelation4 != null) {
              name_4 = sContactInfo!.nameRelation4!;
            }
            if (sContactInfo!.nameRelation5 != null) {
              name_5 = sContactInfo!.nameRelation5!;
            }
            if (sContactInfo!.relation3 != null) {
              relation_3 = DicUtil
                  .array_first_contact[int.parse(sContactInfo!.relation3!) - 1]
                  .menuName;
            }
            if (sContactInfo!.relation4 != null) {
              relation_4 = DicUtil
                  .array_first_contact[int.parse(sContactInfo!.relation4!) - 1]
                  .menuName;
            }
            if (sContactInfo!.relation5 != null) {
              relation_5 = DicUtil
                  .array_first_contact[int.parse(sContactInfo!.relation5!) - 1]
                  .menuName;
            }
          }
          setState(() {});
        } else {
          toast(s_contact_result.message);
        }
      });
    });
  }

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
                      S.of(context).contact_name_f,
                      color: N.orange37,
                      textAlign: TextAlign.left,
                    ),
                    ItemTextView(
                      S.current.relationship_with_you,
                      relation_1,
                      onSelected: (menu) {
                        relation_1 = menu.menuName;
                        contactDataMap['relation_1'] = menu.menuCode;
                        color_1=N.black33;
                      },
                      datas: DicUtil.array_first_contact,
                      vColor: color_1,
                    ),
                    ItemTextView(S.current.contact_number, first_phone,
                        onClick: () {
                      selectContact().then((value) {
                        if (value != null) {
                          first_name = value.fullName!;
                          first_phone = value.phoneNumber!.number!.toString();
                          contactDataMap["name_relation_1"] = first_name;
                          contactDataMap["phone_relation_1"] = first_phone;
                          color_1=N.black33;
                          setState(() {});
                        }
                      });
                    },   vColor: color_1,),
                    ItemTextView(S.of(context).contact_name, first_name,
                        onClick: () {
                      selectContact().then((value) {
                        if (value != null) {
                          first_name = value.fullName!;
                          first_phone = value.phoneNumber!.number!.toString();
                          contactDataMap["name_relation_1"] = first_name;
                          contactDataMap["phone_relation_1"] = first_phone;
                          color_1=N.black33;
                          setState(() {});
                        }
                      });
                    },   vColor: color_1,),
                    Container(
                      height: 27.h,
                    ),
                    TextView(
                      S.of(context).contact_name_s,
                      color: N.orange37,
                      textAlign: TextAlign.left,
                    ),
                    ItemTextView(
                      S.current.relationship_with_you,
                      relation_2,
                      onSelected: (menu) {
                        relation_2 = menu.menuName;
                        contactDataMap['relation2'] = menu.menuCode;
                        color_2=N.black33;
                      },
                      datas: DicUtil.array_first_contact,
                      vColor: color_2,
                    ),
                    ItemTextView(S.current.contact_number, second_phone,
                        onClick: () {
                      selectContact().then((value) {
                        if (value != null) {
                          second_name = value.fullName!;
                          second_phone = value.phoneNumber!.number!.toString();
                          contactDataMap["name_relation_2"] = second_name;
                          contactDataMap["phone_relation_2"] = second_phone;
                          color_2=N.black33;
                          setState(() {});
                        }
                      });
                    },   vColor: color_2,),
                    ItemTextView(S.of(context).contact_name, second_name,
                        onClick: () {
                      selectContact().then((value) {
                        if (value != null) {
                          second_name = value.fullName!;
                          second_phone = value.phoneNumber!.number!.toString();
                          contactDataMap["name_relation_2"] = second_name;
                          contactDataMap["phone_relation_2"] = second_phone;
                          color_2=N.black33;
                          setState(() {});
                        }
                      });
                    },   vColor: color_2,),
                    Container(
                      height: 27.h,
                    ),
                    TextView(
                      S.of(context).contact_name_three,
                      color: N.orange37,
                      textAlign: TextAlign.left,
                    ),
                    ItemTextView(
                      S.current.relationship_with_you,
                      relation_3,
                      onSelected: (menu) {
                        relation_3 = menu.menuName;
                        contactDataMap['relation3'] = menu.menuCode;
                        color_3=N.black33;
                      },
                      datas: DicUtil.array_first_contact,
                      vColor: color_3,
                    ),
                    ItemTextView(S.current.contact_number, phone_3,
                        onClick: () {
                      selectContact().then((value) {
                        if (value != null) {
                          name_3 = value.fullName!;
                          phone_3 = value.phoneNumber!.number!.toString();
                          contactDataMap["name_relation_3"] = name_3;
                          contactDataMap["phone_relation_3"] = phone_3;
                          color_3=N.black33;
                          setState(() {});
                        }
                      });
                    },   vColor: color_3,),
                    ItemTextView(S.of(context).contact_name, name_3,
                        onClick: () {
                      selectContact().then((value) {
                        if (value != null) {
                          name_3 = value.fullName!;
                          phone_3 = value.phoneNumber!.number!.toString();
                          contactDataMap["name_relation_3"] = name_3;
                          contactDataMap["phone_relation_3"] = phone_3;
                          color_3=N.black33;
                          setState(() {});
                        }
                      });
                    }   ,vColor: color_3,),
                    Container(height: 27.h),
                    TextView(
                      S.of(context).contact_name_four,
                      color: N.orange37,
                      textAlign: TextAlign.left,
                    ),
                    ItemTextView(S.current.relationship_with_you, relation_4,
                        onSelected: (menu) {
                      relation_4 = menu.menuName;
                      contactDataMap['relation4'] = menu.menuCode;
                    },vColor: color_4,),
                    ItemTextView(S.current.contact_number, phone_4,
                        onClick: () {
                      selectContact().then((value) {
                        if (value != null) {
                          name_4 = value.fullName!;
                          phone_4 = value.phoneNumber!.number!.toString();
                          contactDataMap["name_relation_4"] = name_4;
                          contactDataMap["phone_relation_4"] = phone_4;
                          color_4=N.black33;
                          setState(() {});
                        }
                      });
                    },vColor: color_4,),
                    ItemTextView(S.of(context).contact_name, name_4,
                        onClick: () {
                      selectContact().then((value) {
                        if (value != null) {
                          name_4 = value.fullName!;
                          phone_4 = value.phoneNumber!.number!.toString();
                          contactDataMap["name_relation_4"] = name_4;
                          contactDataMap["phone_relation_4"] = phone_4;
                          color_4=N.black33;
                          setState(() {});
                        }
                      });
                    },vColor: color_4,),
                    Container(height: 27.h),
                    TextView(
                      S.of(context).contact_name_five,
                      color: N.orange37,
                      textAlign: TextAlign.left,
                    ),
                    ItemTextView(S.current.relationship_with_you, relation_5,
                        onSelected: (menu) {
                      relation_5 = menu.menuName;
                      contactDataMap['relation5'] = menu.menuCode;
                    },vColor: color_5,),
                    ItemTextView(S.current.contact_number, phone_5,
                        onClick: () {
                      selectContact().then((value) {
                        if (value != null) {
                          name_5 = value.fullName!;
                          phone_5 = value.phoneNumber!.number!.toString();
                          contactDataMap["name_relation_5"] =  name_5;
                          contactDataMap["phone_relation_5"] = phone_5;
                          color_5=N.black33;
                          setState(() {});
                        }
                      });
                    },vColor: color_5,),
                    ItemTextView(S.of(context).contact_name, name_5,
                        onClick: () {
                      selectContact().then((value) {
                        if (value != null) {
                          name_5 = value.fullName!;
                          phone_5 = value.phoneNumber!.number!.toString();
                          contactDataMap["name_relation_5"] =  name_5;
                          contactDataMap["phone_relation_5"] = phone_5;
                          color_5=N.black33;
                          setState(() {});
                        }
                      });
                    },vColor: color_5,),
                    Container(height: 27.h),
                    Container(
                      height: 43.h,
                    ),
                    ButtonView(S.current.next_tip, () {
                      // request(UriPath.userContact, contactDataMap).then((value) {
                      //   var result = EmptyReslut.fromJson(value);
                      //   if (result.isSuccess()) {
                      //     Navigator.pop(context);
                          context.startTo(NWorkInfoWidget.routeName);
                      //   } else {
                      //     toast(result.message);
                      //     slog.d("上传失败  == $result ");
                      //   }
                      // });
                    }),
                    Container(
                      height: 25.h,
                    ),
                  ]))
        ],
      ),
    );
  }

  void setMapForResult(SContactResult? it) {
    if (it != null) {
      contactDataMap["name_relation_1"] = it.nameRelation1;
      contactDataMap["phone_relation_1"] = it.phoneRelation1;
      contactDataMap["relation_1"] = it.relation1;
      contactDataMap["relation_2"] = it.relation2;
      contactDataMap["name_relation_2"] = it.nameRelation2;
      contactDataMap["phone_relation_2"] = it.phoneRelation2;


      contactDataMap ["name_relation_3"] = it. nameRelation3;
      contactDataMap["phone_relation_3"] = it.phoneRelation3;
      contactDataMap      ["relation_3"] = it.     relation3;


      contactDataMap ["name_relation_4"] = it. nameRelation4;
      contactDataMap["phone_relation_4"] = it.phoneRelation4;
      contactDataMap      ["relation_4"] = it.     relation4;

      contactDataMap ["name_relation_5"] = it. nameRelation5;
      contactDataMap["phone_relation_5"] = it.phoneRelation5;
      contactDataMap      ["relation_5"] = it.     relation5;


    }
  }
}

Future<PhoneContact?> selectContact() async {
  // if (await Permission.contacts.request().isGranted) {
  return await FlutterContactPicker.pickPhoneContact();
  // }
  // else{
  //   slog.d("未获取权限 ");
  // }
}

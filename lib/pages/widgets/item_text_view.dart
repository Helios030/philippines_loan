import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/city.dart';
import 'package:philippines_loan/model/menu.dart';
import 'package:philippines_loan/model/s_bank_list_result.dart';
import 'package:philippines_loan/pages/widgets/pop_city_view.dart';
import 'package:philippines_loan/pages/widgets/pop_view.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/sp_key.dart';
import 'package:philippines_loan/utils/utils.dart';

import '../../resource.dart';

typedef onDialogClick = Function(MenuItem menu);
typedef onSelectBirthday = Function(String time);
typedef onSelectCity = Function(CityResult city);

//自定义认证选项
class ItemTextView extends StatefulWidget {
  final String title;
  String value;
  final bool isShowIcon;
  AssetImage? itemIcon;
  final bool isShowLine;
  final onDialogClick? onSelected;
  Color vColor;
  final Function? onClick;
  final onSelectBirthday? onBirthday;
  final onSelectBirthday? onLocation;
  final onSelectCity? onCity;
  final onDialogClick? onBank;
  String? cityId;
  List<MenuItem>? datas;

  ItemTextView(
    this.title,
    this.value, {
    this.itemIcon,
    this.isShowIcon = true,
    this.datas,
    this.onSelected,
    this.onClick,
    this.onBirthday,
    this.cityId = "-1",
    this.onCity,
    this.onLocation,
    this.onBank,
    this.isShowLine = true,
    this.vColor = N.gray1A,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemTextView> createState() => _ItemTextViewState();
}

class _ItemTextViewState extends State<ItemTextView> {

  var textSize=14.r;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: GestureDetector(
        onTap: () {
          if (widget.datas != null) {
            showListPop(context, widget.title, widget.datas!, (menu) {
              widget.value = menu.menuName;
              widget.vColor = N.black33;
              //print("選中内容 ===  ${menu}");
              if (widget.onSelected != null) {
                widget.onSelected!(menu);
              }
              setState(() {});
            });
          } else if (widget.onClick != null) {
            widget.onClick!();
          } else if (widget.onBirthday != null) {
            selectBirthday(context).then((value) {
              if (value != null) {
                var birthday = value.toString().split(" ")[0];
                widget.onBirthday!(birthday);
                widget.value = birthday;
                widget.vColor = N.black33;
                setState(() {});
              }
            });
          } else if (widget.onLocation != null) {
            Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high)
                .then((position) {
              Slog.d("position  $position");
              widget.value = "${position.latitude}/${position.longitude}";
              widget.vColor = N.black33;
              widget.onLocation!(widget.value);
              setState(() {});
            });
          } else if (widget.onCity != null) {
            Slog.d("显示Dialog  ${widget.cityId} ");

            if (widget.cityId == "-1" && widget.title == "") {
              toast(S.of(context).plese_select_superior);
              return;
            }
            showCityPop(context, widget.value, widget.cityId.toString(),
                (city) {
              widget.onCity!(city);
              widget.value = city.addressName!;
              widget.vColor = N.black33;
              widget.cityId = city.addressNo.toString();
              setState(() {});
            });
          } else if (widget.onBank != null) {
            textSize=16.r;
            SPData.get(SPKey.USERID.toString(), "").then((id) {
              request(UriPath.bankcode, {
              "user_id" : id,
              "pay_type":"1",
              }).then((value) {
                List<MenuItem> bankList = [];
                var s_bank_list_result = S_bank_list_result.fromJson(value);
                if (s_bank_list_result.code == "200") {
                  if (s_bank_list_result.result != null) {
                    for (var e in s_bank_list_result.result!) {
                      bankList.add(MenuItem(int.parse(e.bankCode!), int.parse(e.bankCode!), e.bankName!,
                          imageUri: e.bankIcon, bankCode: e.bankCode));
                    }
                  }
                  showListPop(context, widget.title, bankList, (menu) {
                    widget.value = menu.menuName;
                    widget.vColor = N.black33;
                    if (widget.onBank != null) {
                      widget.onBank!(menu);
                    }
                    setState(() {});
                  });
                } else {
                  toast(s_bank_list_result.message);
                }
              });
            });
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.title == ""
                ? Container()
                : TextView(
                    widget.title,
                    textAlign: TextAlign.left,
                  ),
            Container(
              height: 13.h,
            ),
            IconTextView(
              widget.value,
              color: widget.vColor,
              isShowArror: widget.isShowIcon,
              textIcon: widget.itemIcon ?? nicon_item_down,
              size: textSize,
            ),
            _buildLine(widget.isShowLine)
          ],
        ),
      ),
    );
  }

  Widget _buildLine(bool isShowLine) {
    return isShowLine
        ? Container(
            margin: EdgeInsets.only(top: 12.h),
            color: N.gray1A,
            height: 1.r,
            width: double.infinity,
          )
        : Container();
  }
}

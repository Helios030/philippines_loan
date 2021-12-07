import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/loan_status.dart';
import 'package:philippines_loan/model/products.dart';
import 'package:philippines_loan/model/s_user_state_result.dart';
import 'package:philippines_loan/pages/authentication/card/card_info_page.dart';
import 'package:philippines_loan/pages/authentication/contact/contact_info_page.dart';
import 'package:philippines_loan/pages/authentication/userinfo/user_info_page.dart';
import 'package:philippines_loan/pages/authentication/work/work_info_page.dart';
import 'package:philippines_loan/pages/confirm/confirm_page.dart';
import 'package:philippines_loan/pages/face/face_detect.dart';
import 'package:philippines_loan/pages/widgets/ruler_view.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/sp_key.dart';

import '../../resource.dart';

SUserStateResult? sUserStateResult;

class ProductScreenWidget extends StatelessWidget {
  final LoanstatusResult? loanResult;


  const ProductScreenWidget(this.loanResult,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ProductScreeBodynWidget());
  }
}

class ProductScreeBodynWidget extends StatefulWidget {
  const ProductScreeBodynWidget({Key? key}) : super(key: key);

  @override
  _ProductScreeBodynWidgetState createState() =>
      _ProductScreeBodynWidgetState();
}

class _ProductScreeBodynWidgetState extends State<ProductScreeBodynWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 375.w,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: (nimg_product_bg),
            fit: BoxFit.fill, /* 完全填充*/
          )),
          child: Container(
              padding: EdgeInsets.only(top: 210.h), child: RulerWidget()),
        ),
      ],
    );
  }
}

class RulerWidget extends StatefulWidget {
  const RulerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RulerWidget> createState() => _RulerWidgetState();
}

class _RulerWidgetState extends State<RulerWidget> {
  var isDown = true;
  var isUp = true;
  var currIndex = 0;
  var isNeedBuild = false;
  var loan_term = "120";
  var max_money = "10000";

  PResult? currvalue;

  var lists = <PResult>[];

  var isAvailable = true;

  @override
  void initState() {
    super.initState();

    SPData.get(SPKey.USERID.toString(), "").then((id) {
      if (id.toString().isSafe()) {
        var map = Map<String, String>();
        map["user_id"] = id;
        request(UriPath.queryproducts2, {"user_id": id}).then((value) {
          Slog.d("返回结果   $value");
          var product = Products.fromJson(value);
          lists = product.result!;
          var lickList = [];
          for (var value in lists) {
            if (value.enable == "1") {
              lickList.add(value);
            }
          }
          Slog.d("筛选解锁项 $lickList ");
          if (lickList.isNotEmpty && lickList.last != null) {
            setNewValue(lickList.last!);

          }
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 5.h, top: 5.h),
              child: TextView(
                S.of(context).you_want_borrow,
                color: N.black36,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (currIndex != 0) {
                    currIndex--;
                  }
                  isNeedBuild = true;
                  setNewValue(lists[currIndex]);

                  print("onclick   curr  $currIndex");
                  setState(() {});
                },
                child: Container(
                    width: 26.r,
                    height: 26.r,
                    child: Image(
                      image: (isDown ? nicon_down_r : nicon_down),
                      fit: BoxFit.fill,
                    )),
              ),
              Container(
                  padding: EdgeInsets.only(
                    left: 26.w,
                    right: 26.w,
                  ),
                  child: TextView(
                    currvalue != null ? currvalue!.principal! : "",
                    color: N.red20,
                    size: 31.r,
                  )),
              GestureDetector(
                onTap: () {
                  if (currIndex < lists.length - 1) {
                    currIndex++;
                  }
                  isNeedBuild = true;
                  print("onclick   up  $currIndex");
                  setNewValue(lists.isEmpty?null:lists[currIndex]);
                  setState(() {});
                },
                child: Container(
                    width: 26.r,
                    height: 26.r,
                    child: Image(
                      image: (isUp ? nicon_up : nicon_ip_n),
                      fit: BoxFit.fill,
                    )),
              ),
            ],
          ),
          Container(
            child: Stack(
              children: [
                RulerView(
                  width: 344,
                  height: 35,
                  currValue: currIndex * 10,
                  minValue: 0,
                  maxValue: (lists.length - 1) * 10,
                  step: 1,
                  subScaleWidth: 10,
                  subScaleCountPerScale: 10,
                  scaleColor: N.grayAB,
                  scaleWidth: 2,
                  lists: toStringList(lists),
                  isNeedBuild: isNeedBuild,
                  scaleTextColor: N.grayAB,
                  scaleTextWidth: 15,
                  onSelectedChanged: (result) {
                    isNeedBuild = false;
                    isDown = result > 0;
                    currIndex = result;

                    if (result == lists.length - 1) {
                      isUp = false;
                    } else {
                      isUp = true;
                    }
                    setNewValue(lists[result]);
                    setState(() {});
                  },
                ),
                // GestureDetector(
                //     onTap: null,
                //     child: Image(image: (nimg_ruler_bg))),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.w, top: 28.h),
                width: 149.w,
                height: 119.h,
                color: N.meetF1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            left: 14.w, right: 14.w, top: 2.w, bottom: 2.w),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: (nimg_rd_bg),
                          fit: BoxFit.fill, /* 完全填充*/
                        )),
                        child: TextView(
                          S.of(context).time,
                          color: N.black36,
                        )),
                    Container(
                        margin:
                            EdgeInsets.only(left: 22.w, top: 10.h, bottom: 7.h),
                        child: TextView(S.of(context).loan_term,
                            color: N.black36)),
                    Container(
                        margin: EdgeInsets.only(
                          left: 22.w,
                        ),
                        child: TextView(loan_term, size: 31.r, color: N.red20)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 6.w, top: 28.h),
                width: 149.w,
                height: 119.h,
                color: N.meetF1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            left: 14.w, right: 14.w, top: 2.w, bottom: 2.w),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: (nimg_rd_bg),
                          fit: BoxFit.fill, /* 完全填充*/
                        )),
                        child: TextView(
                          S.of(context).quota,
                          color: N.black36,
                        )),
                    Container(
                        margin:
                            EdgeInsets.only(left: 22.w, top: 10.h, bottom: 7.h),
                        child: TextView(S.of(context).highest_loanable,
                            color: N.black36)),
                    Container(
                        margin: EdgeInsets.only(
                          left: 22.w,
                        ),
                        child: TextView(max_money, size: 30.r, color: N.red20)),
                  ],
                ),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 51.h),
              child: InkWell(
                onTap: isAvailable
                    ? () {
                        if (currvalue != null) {
                          SPData.get(SPKey.USERID.toString(), "").then((id) {
                            if (id.toString().isSafe()) {
                              var map = Map<String, String>();
                              map["user_id"] = id;
                              request(UriPath.userStatus, map).then((value) {
                                var result =
                                    S_user_state_result.fromJson(value);
                                if (result.code == "200") {
                                  SPData.put(SPKey.ISMAIN.toString(), true);
                                  sUserStateResult = result.result;
                                  SPData.put(SPKey.PRODUCTID.toString(),
                                      currvalue!.productId);
                                  if (sUserStateResult != null) {
                                    if (sUserStateResult!.personStatus == "0") {
                                      Navigator.pushNamed(
                                          context, NUserInfoWidget.routeName);
                                    } else if (sUserStateResult!.compStatus ==
                                        "0") {
                                      Navigator.pushNamed(
                                          context, NWorkInfoWidget.routeName);
                                    } else if (sUserStateResult!
                                            .contactStatus ==
                                        "0") {
                                      Navigator.pushNamed(context,
                                          NContactInfoWidget.routeName);
                                    } else if (sUserStateResult!.cardStatus ==
                                        "0") {
                                      Navigator.pushNamed(
                                          context, NCardInfoWidget.routeName);
                                    } else {
                                      SPData
                                          .get(SPKey.USERID.toString(), "")
                                          .then((id) {
                                        Map<String, dynamic> dataMap = {};
                                        dataMap["user_id"] = id;
                                        request(UriPath.queryloanstatus,
                                                dataMap)
                                            .then((value) {
                                          Loanstatus jsonResult =
                                              Loanstatus.fromJson(value);
                                          if (jsonResult.code == "200") {
                                            var loanResult = jsonResult.result;
                                            if (loanResult != null) {
                                              if (loanResult.loanStatus ==
                                                  "3") {
                                                toast(S
                                                    .of(context)
                                                    .start_fail_tip);
                                              } else {
                                                if (loanResult.hasLoanApp ==
                                                    true) {
                                                  SPData.put(
                                                      SPKey.ISREREQUEST
                                                          .toString(),
                                                      true);
                                                  Navigator.pushNamed(
                                                      context,
                                                      NConfirmPageWidget
                                                          .routeName);
                                                } else {
                                                  SPData.put(
                                                      SPKey.ISREREQUEST
                                                          .toString(),
                                                      false);
                                                  Navigator.pushNamed(
                                                      context,
                                                      NFaceDetectorWidget
                                                          .routeName);
                                                }
                                              }
                                            }
                                          } else {
                                            toast(jsonResult.message);
                                          }
                                        });
                                      });
                                    }
                                  }
                                } else {
                                  toast(result.message);
                                }
                              });
                            }
                          });
                        }
                      }
                    : null,
                child: Container(
                    width: 312.r,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: isAvailable ? (nimg_btn_bg) : (nimg_btn_bg_meet),
                      ),
                    ),
                    child: TextView(
                      isAvailable
                          ? S.of(context).borrow_money_now
                          : S.of(context).not_money_now,
                      size: 17,
                      color: Colors.white,
                    )),
              )),
        ],
      ),
    );
  }

  void setNewValue(PResult? value) {
    currvalue = value;
    currIndex = lists.indexOf(currvalue!);
    isAvailable = currvalue!.enable == "1";
    loan_term = currvalue!.duration!.toString();
    max_money = lists.last.principal.toString();
    setState(() {});
  }

  List<String> toStringList(List<PResult> lists) {
    var newList = lists.map((e) => e.principal.toString()).toList();

    return newList;
  }
}

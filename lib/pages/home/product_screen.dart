import 'package:flutter/material.dart';
import 'package:philippines_loan/pages/authentication/idcard/id_card_page.dart';
import 'package:philippines_loan/pages/face/face_detect.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/ruler_view.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import '../../resource.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'package:philippines_loan/utils/expand_util.dart';

class ProductScreenWidget extends StatelessWidget {
  const ProductScreenWidget({Key? key}) : super(key: key);

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
  var lists = <String>["1000", "2000", "3000", "4000", "5000"];

  var isDown = true;
  var isUp = true;
  var currIndex = 3;
  var isNeedBuild = false;
  var currvalue = "5000";

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
                "你想借",
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
                  currvalue = lists[currIndex];
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
                    currvalue,
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
                  currvalue = lists[currIndex];
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
                  lists: lists,
                  isNeedBuild: isNeedBuild,
                  scaleTextColor: N.grayAB,
                  scaleTextWidth: 15,
                  onSelectedChanged: (result) {
                    isNeedBuild = false;
                    isDown = result > 0;
                    currIndex = result;


                    if(result == lists.length-1){
                      isUp=false;
                    }else{
                      isUp=true;
                    }

                    slog.d("isUp $isUp result $result  lists.length  ${lists.length} ");


                    currvalue = lists[result];
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
                          "时间",
                          color: N.black36,
                        )),
                    Container(
                        margin:
                            EdgeInsets.only(left: 22.w, top: 10.h, bottom: 7.h),
                        child: TextView("贷款期限", color: N.black36)),
                    Container(
                        margin: EdgeInsets.only(
                          left: 22.w,
                        ),
                        child: TextView("120", size: 31.r, color: N.red20)),
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
                          "额度",
                          color: N.black36,
                        )),
                    Container(
                        margin:
                            EdgeInsets.only(left: 22.w, top: 10.h, bottom: 7.h),
                        child: TextView("最高可借", color: N.black36)),
                    Container(
                        margin: EdgeInsets.only(
                          left: 22.w,
                        ),
                        child: TextView("10000", size: 31.r, color: N.red20)),
                  ],
                ),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 51.h),
              child: ButtonView("立即借钱", () {

                context.startTo(NIdCardPage.routeName);
                // context.startTo(NFaceDetectorWidget.routeName);


              })),
        ],
      ),
    );
  }
}

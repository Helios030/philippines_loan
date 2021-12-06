import 'package:flutter/material.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/scoupon_result.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/sp_key.dart';

import '../../resource.dart';

class NCouponWidget extends StatefulWidget {
  static const String routeName = "/coupon";

  const NCouponWidget({Key? key}) : super(key: key);

  @override
  _NCouponWidgetState createState() => _NCouponWidgetState();
}

class _NCouponWidgetState extends State<NCouponWidget>
    with SingleTickerProviderStateMixin {
  TabController? mController;
  List<Widget> tabList = [
    Tab(text: S.current.not_use),
    Tab(text: S.current.used),
    Tab(text: S.current.expired),
  ];

  int currIndex = 0;
  CouponResult? couponAmount;

  var dateStr = "2021.10.09已过期";

  @override
  void initState() {
    super.initState();
    mController = TabController(
      length: tabList.length,
      vsync: this,
    );

    mController?.addListener(() {
      if (mController!.index == mController!.animation!.value) {
        currIndex = mController!.index;
        Slog.d("选中  $currIndex");
      }
    });

    getCashCouponById(currIndex).then((value) {
      couponAmount = value;
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(S.current.my_loan),
          TabBar(
              indicatorColor: N.red20,
              indicatorWeight: 1.5.r,
              controller: mController,
              labelColor: N.red20,
              labelStyle:
                  TextStyle(fontSize: 16.r, fontWeight: FontWeight.bold),
              unselectedLabelColor: N.black33,
              unselectedLabelStyle:
                  TextStyle(fontSize: 16.r, fontWeight: FontWeight.bold),
              tabs: tabList),
          Container(
            height: 137.h,
            padding: EdgeInsets.only(
                left: 26.w, top: 10.h, right: 12.w, bottom: 22.h),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: (nimg_coupon_bg),
              fit: BoxFit.fill, /* 完全填充*/
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 90.r,
                  height: 90.r,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: ( couponAmount?.status == 1?nimg_coupon_bg:nimg_coupon_bg_2),
                    fit: BoxFit.fill, /* 完全填充*/
                  )),
                  child: Column(
                    children: [
                      //todo tianzhi
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: couponAmount?.status == 1
                          ? Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  TextView("还款时可使用"),
                                  ButtonView(
                                    "去使用",
                                    () {},
                                    size: 95.w,
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              height: 60.r,
                              width: 60.r,
                              child: couponAmount?.status == 2
                                  ? Image(image: nimg_coupon_used)
                                  : Image(image: nimg_coupon_expired),
                            ),
                    ),
                    TextView(
                      dateStr,
                      size: 12,
                      color: N.grayAB,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    mController?.dispose();
  }
}

Future<CouponResult?> getCashCouponById(int currIndex) async {
  var user_id = await SPData.get(SPKey.USERID.toString(), "");

  var jsonStr = await request(UriPath.cashCoupon, {"user_id": user_id});

  var jsonResult = SCouponResult.fromJson(jsonStr);
  return jsonResult.result;
}

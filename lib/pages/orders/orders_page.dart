import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/orders.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/resource.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/sp_key.dart';

class NOrdersPage extends StatefulWidget {
  const NOrdersPage({Key? key}) : super(key: key);
  static String routeName = "/orders";

  @override
  _NOrdersPageState createState() => _NOrdersPageState();
}

class _NOrdersPageState extends State<NOrdersPage> {
  List<OrdersResult>? list;

  @override
  void initState() {
    sp_data.get(SPKey.USERID.toString(), "").then((id) {
      Map<String, dynamic> dataMap = {};
      dataMap["user_id"] = id;
      //print("user_id  $id");
      request(UriPath.loanappquery, dataMap).then((value) {
        var result = Orders.fromJson(value);
        list = result.result;
        slog.d("order list    $list");
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(S.current.my_loan),
          list == null || list!.isEmpty
              ? Column(children: [
                  Container(
                    margin: EdgeInsets.only(top: 78.h, bottom: 30.h),
                    width: 121.r,
                    height: 121.r,
                    child: Image(
                      image: nimg_not_order,
                    ),
                  ),
                  TextView(
                    "暂无订单",
                    color: N.gray6F,
                  )
                ])
              : ListView(shrinkWrap: true, children: _buildItem(list!)),
        ],
      ),
    );
  }

  List<Widget> _buildItem(List<OrdersResult> list) {
    var widgets = <Widget>[];
    for (OrdersResult result in list) {
      widgets.add(_buildOrderItem(result));
    }
    return widgets;
  }

  Widget _buildOrderItem(OrdersResult result) {
    var leftText = "借款金额";
    var rightText = "审核中";
    var dateText = "申请时间：";
    var number = "8000";
    var isRed = true;
    var isDateRed = false;
    var loanDate = "7";

//    2、放弃借款
//    3、申请失败
//    5、还款中
//    6、已还款
//    7、已逾期
//    8、已结清
//    9、借款失败
//    10. 还款审核中
//    1、申请中
//    4、申请成功

    loanDate = result.duration.toString();
    number = result.principal.toString();
    dateText=dateText+result.appTime.toString();


    switch (result.loanStatus) {
      case 1:
      case 4:
        rightText = S.of(context).review;
        break;

      case 9:
      case 3:
        rightText = S.of(context).review_faile;
        isRed=false;
        break;

      case 2:
        rightText = S.of(context).order_cancel;
        isRed=false;
        break;
      case 5:
      case 10:
        rightText = S.of(context).repay;
        // topText = result.amount2Account;

        break;
      case 7:
        rightText = S.of(context).over;
        // topText = result.amount2Account;
        isDateRed=true;
        break;
      case 6:
      case 8:
        rightText = S.of(context).settle;
        // topText = result.principal;
        isRed=false;
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: N.meetF1,
        borderRadius: BorderRadius.all(Radius.circular(3.r)),
      ),
      margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 5.w, bottom: 5.h),
      height: 108.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 22.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextView(
                  leftText,
                  size: 13,
                  color: N.black36,
                ),
                TextView(
                  number,
                  size: 31,
                  color: isRed ? N.red20 : N.black33,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextView(
                S.current.loan_date,
                size: 13,
                color: N.black36,
              ),
              TextView(
                loanDate,
                size: 31,
                color: N.black33,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: 21.w, right: 21.w, top: 3.h, bottom: 3.h),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: (nicon_bg_right),
                  fit: BoxFit.fill, /* 完全填充*/
                )),
                child: TextView(
                  rightText,
                  size: 13,
                  color: N.black36,
                  textAlign: TextAlign.right,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 9.h, right: 13.w),
                child: TextView(
                  dateText,
                  size: 10,
                  color: isDateRed ? N.red20 : N.black33,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

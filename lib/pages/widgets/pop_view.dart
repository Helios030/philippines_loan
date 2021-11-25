import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/menu.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/slog.dart';

import '../../resource.dart';

class PopView {}

//显示基类
showBasePopView(BuildContext context, Widget widget) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r)),
              color: Colors.white),
          child: widget);
    },
  );
}

//普通点击事件 start =========
showSimplePop(BuildContext context, String title, GestureTapCallback onOKClick,
    GestureTapCallback onCancelClick) {
  var simpleWidget = Container(
    padding: EdgeInsets.only(top: 17.h, bottom: 20.h),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextView(
          title,
          color: N.black33,
        ),
        Container(
          height: 1.h,
          color: N.pinkF1,
          margin: EdgeInsets.only(top: 17.h, bottom: 13),
        ),
        GestureDetector(
            onTap: onOKClick,
            child: TextView(
              S.current.ok,
              color: N.red20,
            )),
        Container(
          height: 10.h,
          color: N.pinkF1,
          margin: EdgeInsets.only(top: 16.h, bottom: 20),
        ),
        GestureDetector(
            onTap: onCancelClick,
            child: TextView(
              S.current.cancel,
              color: N.gray6F,
            )),
      ],
    ),
  );

  showBasePopView(context, simpleWidget);
}

//普通点击事件 end =========


//普通列表选择  start =========
typedef onSelected = Function(MenuItem menu);

showListPop(BuildContext context, String title, List<MenuItem> items,
    onSelected onselected,{MenuItem? currMenu}) {
  showBasePopView(context, listPopScreen(title, items, onselected,selectMenu: currMenu,));
}

List<Widget> buildPopItem(
    List<MenuItem> items, onSelected onselected, MenuItem? currItem) {
  slog.d("当前选中  $currItem ");
  var widgetItems = <Widget>[];

  for (MenuItem item in items) {
    bool isSelected = false;
    if (currItem != null) {
      isSelected = item.index == currItem.index;
    }

    widgetItems.add(GestureDetector(
      onTap: () {
        onselected(item);
      },
      child: Column(
        children: [
          Container(
            height: 48.h,
            width: double.infinity,
            color: isSelected ? N.pinkF1 : Colors.white,
            child: Center(
              child: TextView(
                item.menuName,
                color: isSelected ? N.red07 : N.gray6F,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(height: 1.h, color: N.pinkF1),
        ],
      ),
    ));
  }

  return widgetItems;
}

class listPopScreen extends StatefulWidget {
  final String title;
  final List<MenuItem> items;
  final onSelected onselected;

final MenuItem? selectMenu;
  const listPopScreen(this.title, this.items, this.onselected, {this.selectMenu,Key? key})
      : super(key: key);

  @override
  _listPopScreenState createState() => _listPopScreenState();
}

class _listPopScreenState extends State<listPopScreen> {
  MenuItem? currItem;

  @override
  void initState() {

    super.initState();

    if(widget.selectMenu==null){
      currItem=widget.items.first;
    }else{
      currItem=  widget.selectMenu;
    }


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 17.h, bottom: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 14.w),
                child: TextView(
                  widget.title,
                  color: N.black33,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    context.finish();
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 20.w),
                      width: 16.r,
                      height: 16.r,
                      child: Image(image: (nicon_pop_close))))
            ],
          ),
          Container(
            height: 1.h,
            color: N.pinkF1,
            margin: EdgeInsets.only(top: 17.h),
          ),
          Column(
            children: buildPopItem(widget.items, (menu) {
              setState(() {
                currItem = menu;
                widget.onselected(menu);
                Future.delayed(const Duration(milliseconds: 1000), () {
                  context.finish();
                });
              });
            },  currItem),
          ),
        ],
      ),
    );
  }
}
//普通列表选择 end =========
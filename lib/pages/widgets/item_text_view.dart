


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/model/menu.dart';
import 'package:philippines_loan/pages/widgets/pop_view.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/utils/ncolors.dart';

typedef onDialogClick = Function(MenuItem menu);
//自定义认证选项
class ItemTextView extends StatefulWidget {
  final String title;
  String value;
  final bool isShowIcon;
  final bool isShowLine;
  final onDialogClick? onSelected;
  Color vColor;
  final Function? onClick;
  List<MenuItem>? datas;

  ItemTextView(this.title, this.value, {this.isShowIcon = true, this.datas,this.onSelected,this.onClick,this.isShowLine=true,this.vColor=N.gray1A,   Key? key,}): super(key: key);

  @override
  State<ItemTextView> createState() => _ItemTextViewState();
}

class _ItemTextViewState extends State<ItemTextView> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: GestureDetector(
        onTap: () {
          if (widget.datas != null) {
            showListPop(context, widget.title, widget.datas!, (menu) {
              widget.value = menu.menuName;
              widget.vColor=N.black33;
              //print("選中内容 ===  ${menu}");
              if (widget.onSelected!=null) {
                widget.onSelected!(menu);
              }
              setState(() {});
            });
          }else if(widget.onClick!=null){
            widget.onClick!();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

           widget. title==""?Container(): TextView(widget.title,textAlign: TextAlign.left,),



            Container(height: 13.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconTextView(
                  widget.value,
                  color:widget.vColor,
                  isShowArror: widget.isShowIcon,
                ),
              ],
            ),
            _buildLine(widget.isShowLine)
          ],
        ),
      ),
    );
  }

  Widget _buildLine(bool isShowLine) {

    return isShowLine?
    Container(
      margin: EdgeInsets.only(top: 12.h),
      color: N.gray1A,
      height: 1.r,
      width: double.infinity,
    ) :
    Container();
  }
}


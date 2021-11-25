



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/utils/ncolors.dart';

class EditTextView extends StatefulWidget {

  final String title;
  final TextEditingController NController;
  final ValueChanged<String>? onTextChage;
  var tt= TextInputType.text;

  EditTextView(this.title, this.onTextChage,this.NController,{this.tt= TextInputType.text,Key? key}) : super(key: key);
  @override
  _EditTextViewState createState() => _EditTextViewState();
}

class _EditTextViewState extends State<EditTextView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      height: 70.h,
      child: Column(
        children: [
          Row(
            children: [
              TextView(widget.title,textAlign: TextAlign.left,),
            ],
          ),
          TextField(
            onChanged: widget.onTextChage,
            controller: widget.NController,
            maxLines: 1,
            keyboardType: widget.tt,
            textAlign: TextAlign.left,
            style: TextStyle(color: N.black33, fontSize: 14.r),
            decoration: InputDecoration(
                hintText: S.current.please_input,
                hintStyle: const TextStyle(color: N.grayD6), //修改颜色
                border: InputBorder.none),
          ),
          Container(
            color: N.gray1A,
            height: 1.r,
            width: double.infinity,
          )
        ],
      ),
    );
  }

}

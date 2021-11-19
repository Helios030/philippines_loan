import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/utils/ncolors.dart';

class InputTextView extends StatefulWidget {
  final String title;
  final TextEditingController NController;
  final ValueChanged<String>? onTextChage;
  var tt = TextInputType.text;
  int length =100;



  InputTextView(this.title, this.NController, this.onTextChage,
      {this.tt = TextInputType.text,this.length=100, Key? key})
      : super(key: key);

  @override
  _InputTextViewState createState() => _InputTextViewState();
}

class _InputTextViewState extends State<InputTextView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        TextView(widget.title),
        TextField(
          onChanged: widget.onTextChage,
          controller: widget.NController,
          maxLines: 1,

          maxLength: widget.length,
          keyboardType: widget.tt,

          style: TextStyle(color: N.black33, fontSize: 16.r,fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              hintText: S.current.please_input,
              counterText: "",
              hintStyle: const TextStyle(color: N.grayD6), //修改颜色
              border: InputBorder.none),
        ),

          Container(
            width: double.infinity,
            color: N.gray1A,
            height: 1.h,
          )

      ],),
    );
  }
}



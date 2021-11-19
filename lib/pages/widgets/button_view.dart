


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/resource.dart';

class ButtonView extends StatelessWidget {
  String text;
  GestureTapCallback? onClick;
  double  size=312.0;
  ButtonView(this.text,this.onClick,{this.size=312.0,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: size.r,
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(nimg_btn_bg),
            ),
          ),
          child: TextView(text,size: 17,color: Colors.white,)),

    );
  }
}

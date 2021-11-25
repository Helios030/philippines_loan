



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/utils/ncolors.dart';

import '../../resource.dart';

class TextView extends StatelessWidget {

  String text="";
  double size;
  var color;
  var weight;
  TextAlign textAlign;


  TextView (this.text,{this.size=14,this.color=N.pinkCF,this.weight=FontWeight.bold,this.textAlign=TextAlign.left,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: textAlign,
      style: TextStyle(fontSize: size.r,color: color,fontWeight: weight),


    );








  }
}





class IconTextView extends StatelessWidget {
  String text="";
  double size;
  var color;
  var weight;
  TextAlign textAlign;
  bool isShowArror;

  IconTextView (this.text,{this.isShowArror=false,this.size=14,this.color=N.pinkCF,this.weight=FontWeight.bold,this.textAlign=TextAlign.left,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 338 .w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(text,size:size,color:color,weight:weight,textAlign:textAlign),
          isShowArror ? Container(width:22.r,height:22.r,child: Image(image: nicon_item_down)) : Container()
        ],
      ),
    );
  }


}



class showTextView extends StatelessWidget {
  String text="";
  String rText="";

  bool isShowLine;

  showTextView (this.text,this.rText,{this.isShowLine=true,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(text,color:N.black36,textAlign: TextAlign.left,),
              TextView(rText,color:N.black33,textAlign: TextAlign.right,),
            ],
          ),

          isShowLine ? Container( margin: EdgeInsets.only(top: 14.h,bottom: 14.h) ,height:1.r,color: N.grayF4,) : Container()

        ],
      ),
    );
  }


}






import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/utils/ncolors.dart';

class TextView extends StatelessWidget {

  String text="";
  double size;
  var color;
  var weight;

   TextView (this.text,{this.size=14,this.color=N.pinkCF,this.weight=FontWeight.bold,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: size.r,color: color,fontWeight: weight),);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/pop_view.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/utils/dictionary_util.dart';
import 'package:philippines_loan/utils/slog.dart';

class NHomePage extends StatefulWidget {
  const NHomePage({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<NHomePage> createState() => _NHomePageState();
}

class _NHomePageState extends State<NHomePage> {
  var mainPage=<Widget>[


  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Align(

        child: ButtonView("show  pop",(){
          // showSimplePop(context,"确定要拨打客服电话？",(){
          //   slog.d("ok");
          // },(){
          //   slog.d("cancel");
          //
          // });


          showListPop(context,"ceshi",DicUtil.array_children_num,(menu){
            print("xuanzhogn   $menu");
            setState(() {
            });
          },currMenu: DicUtil.array_children_num[3]);


        })

        ,

      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:philippines_loan/pages/confirm/confirm_page.dart';
import 'package:philippines_loan/pages/home/product_screen.dart';
import 'package:philippines_loan/pages/home/review_screen.dart';
import 'package:philippines_loan/pages/home/wait_pay_screen.dart';
import 'package:philippines_loan/pages/widgets/ruler_view.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/utils/dictionary_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/slog.dart';

import 'fail_screen.dart';
import 'loaning_screen.dart';
class NHomePage extends StatefulWidget {
  const NHomePage({Key? key}) : super(key: key);
  static String routeName = "/home";




  @override
  State<NHomePage> createState() => _NHomePageState();
}

class _NHomePageState extends State<NHomePage> {
  var mainPage=<Widget>[


  ];

  var lists=<String>["1000","2000","3000","4000","5000"];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Align(
        child:ProductScreenWidget(),
        // child:NConfirmPageWidget(null),

        // ButtonView("show  pop",(){
        //   // showSimplePop(context,"确定要拨打客服电话？",(){
        //   //   slog.d("ok");
        //   // },(){
        //   //   slog.d("cancel");
        //   //
        //   // });
        //
        //
        //   showListPop(context,"ceshi",DicUtil.array_children_num,(menu){
        //     print("xuanzhogn   $menu");
        //     setState(() {
        //     });
        //   },currMenu: DicUtil.array_children_num[3]);
        //
        //
        // }








      ),

    );
  }
}

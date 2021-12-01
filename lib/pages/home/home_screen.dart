import 'package:flutter/material.dart';
import 'package:philippines_loan/pages/home/product_screen.dart';
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




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/pages/home/home_screen.dart';
import 'package:philippines_loan/pages/user/user_page.dart';
import 'package:philippines_loan/utils/ncolors.dart';

import '../../resource.dart';

class NMainPage extends StatefulWidget {

  static String routeName = "/main";


  const NMainPage({Key? key}) : super(key: key);

  @override
  _NMainPageState createState() => _NMainPageState();
}

class _NMainPageState extends State<NMainPage> {

  var pages=<Widget>[

    NHomePage(),
    NUserPage(),

  ];

  var index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: N.red20,
        unselectedItemColor: N.black33,
        selectedFontSize: 14.r,
        unselectedFontSize: 12.r,
        onTap: (tap){
          setState(() {
            index =tap;
          });
        },
        items:  [
          BottomNavigationBarItem( icon: Container(width: 24.r,height: 24.r,child: Image(image:index==0? AssetImage(nicon_tab_pay): AssetImage(nicon_tab_pay_n))) ,label: S.of(context).loan,backgroundColor: N.red20),
          BottomNavigationBarItem( icon: Container(width: 24.r,height: 24.r,child: Image(image:index==1? AssetImage(nicon_main_user_y): AssetImage(nicon_main_user_n))) ,label: S.of(context).main_user,backgroundColor: N.red20),
        ],
      ),
    );
  }
}

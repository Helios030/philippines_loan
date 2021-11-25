import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveness_plugin/liveness_plugin.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/resource.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/utils/ncolors.dart';

class NFaceDetectorWidget extends StatelessWidget {
  const NFaceDetectorWidget({Key? key}) : super(key: key);
  static const String routeName = "/face";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(

          children: [

            AppBarWidget(S.current.face_title),



        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(
                // margin: EdgeInsets.only(top: 134.h),
                  width: 120.w,
                  height: 124.h,
                  child: Image(image: nimg_face_d,)),


              TextView(S.current.face_tip,size:16 ,color:N.black15,textAlign: TextAlign.center,),

              ButtonView(S.current.next_tip, () {



              }),


            ]
          ),
        )



    ]
    ,
    )
    ,
    );
  }
}


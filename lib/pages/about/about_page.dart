import 'package:flutter/material.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resource.dart';

class NAboutPage extends StatelessWidget {
  const NAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(S.current.about_us),
          Container(
              width: 87.r,
              height: 87.r,
              margin: EdgeInsets.only(top: 36.h, bottom: 19.h),
              child: Image(
                image: nic_launcher,
              )),
          TextView(
            "V" + PackConfig.version,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 52.h,
          ),
          TextView(
            "隐私协议",
            textAlign: TextAlign.left,
          ),
          Container(
            height: 1.h,
            color: N.black33,
          ),
          TextView(
            "查看更新",
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}

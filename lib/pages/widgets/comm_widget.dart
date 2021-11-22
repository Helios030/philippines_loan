import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/utils/ncolors.dart';

class userItemWidget extends StatelessWidget {
  final String image;
  final String text;
  final bool isShowLine;
  final GestureTapCallback? onclick;


  const userItemWidget(this.text, this.image, {Key? key, this.isShowLine = true,this.onclick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onclick,
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: 10.h, bottom: 10.h, left: 16.w, right: 16.h),
                    width: 42.r,
                    height: 42.r,
                    child: Image(image: AssetImage(image))),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextView(
                          text,
                          color: N.black33,
                        )))
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 65.w),
              height: 1.h,
              color: N.grayF2,
            ),
          ],
        ),
      ),
    );
  }
}

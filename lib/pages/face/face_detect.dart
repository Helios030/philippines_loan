import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveness_plugin/liveness_plugin.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/license_result.dart';
import 'package:philippines_loan/pages/confirm/confirm_page.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/resource.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/sp_key.dart';
import 'package:philippines_loan/utils/utils.dart';


class NFaceDetectorWidget extends StatefulWidget {
  const NFaceDetectorWidget({Key? key}) : super(key: key);
  static const String routeName = "/face";

  @override
  State<NFaceDetectorWidget> createState() => _NFaceDetectorWidgetState();
}

Future<String?> _checkLicense(String license) async {
  return await LivenessPlugin.setLicenseAndCheck(license);
}

class _NFaceDetectorWidgetState extends State<NFaceDetectorWidget>  implements LivenessDetectionCallback{
  String? license = "";

  @override
  void initState() {
    super.initState();
    SPData.get(SPKey.USERID.toString(), "").then((id) {
      request(UriPath.license, {"user_id": id}).then((value) {
        var reslut = License_resuult.fromJson(value);

        if (reslut.code == "200") {
          license = reslut.result!.license;
          //print("request license $license");
          if (license.isSafe()) {
            _checkLicense(license!).then((value) {
              if ("SUCCESS" == value) {
                Slog.d("key 检测成功");
              } else {
                // todo  APPLICATION_ID_NOT_MATCH
                //print("key 检测失败 $value");
                toast(value);
              }
            });
          }
        } else {
          toast(reslut.message);
        }
      });
    });
    //界面编译完成时
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      uploadInfo(context);
    });
  }

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
                      margin: EdgeInsets.only(top: 100.h),
                      width: 120.w,
                      height: 124.h,
                      child: Image(
                        image: nimg_face_d,
                      )),
                  TextView(
                    S.current.face_tip,
                    size: 16,
                    color: N.black15,
                    textAlign: TextAlign.center,
                  ),
                  ButtonView(S.current.next_tip, () {

                    startToLive();

                  }),
                ]),
          )
        ],
      ),
    );
  }

  @override
  void onGetDetectionResult(bool isSuccess, Map<dynamic, dynamic>? resultMap) {
    //print("人脸返回结果   $isSuccess  $resultMap");

    if(isSuccess&&resultMap!=null){
      SPData.put(SPKey.lIVENESSID.toString(), resultMap["livenessId"]);
      context.startTo( NConfirmPageWidget.routeName);
    }

  }

  Future<void> startToLive() async {
    Slog.d("startToLive   ");
    // if (await Permission.camera.request().isGranted) {
      LivenessPlugin.startLivenessDetection(this);
    // }else{
    //   Slog.d("无权限");
    // }
  }

}

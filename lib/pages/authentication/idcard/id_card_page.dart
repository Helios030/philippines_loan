import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/empty_result.dart';
import 'package:philippines_loan/model/menu.dart';
import 'package:philippines_loan/pages/authentication/userinfo/user_info_page.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/pop_view.dart';
import 'package:philippines_loan/pages/widgets/text_view.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/sp_key.dart';

import '../../../resource.dart';

var isIdUpload = false;
var isWorkUpload = false;

class NIdCardPage extends StatefulWidget {
  static const String routeName = "/id_card";

  const NIdCardPage({Key? key}) : super(key: key);

  @override
  _NIdCardPageState createState() => _NIdCardPageState();
}

class _NIdCardPageState extends State<NIdCardPage> {


  var isLoanAgreement=false;
  var isDislosure=false;



  Image idImageWidget = Image(
    image: nimg_upload_id,
    fit: BoxFit.fill,
  );
  Image workImageWidget = Image(
    image: nimg_upload_work,
    fit: BoxFit.fill,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(S.current.certification),
            GestureDetector(
                onTap: () {
                  showSelectPhotoDialog(context, (menu) {
                    selectPhoto(menu.menuCode == 0).then((photo) {
                      if (photo != null) {
                        setState(() {
                          idImageWidget = Image.file(
                            File(photo.path),
                            width: 180.w,
                            height: 120.h,
                          );
                          upLoadImg(photo, true);
                        });
                      }
                    });
                  });
                },
                child: SizedBox(
                    width: 272.w, height: 174.h, child: idImageWidget)),
            Container(
                width: 304.w,
                margin: EdgeInsets.only(top: 19.h, bottom: 40.h),
                child: TextView(
                  S.of(context).id_card_tip,
                  color: N.black36,
                  textAlign: TextAlign.center,
                )),
            GestureDetector(
                onTap: () {
                  showSelectPhotoDialog(context, (menu) {
                    selectPhoto(menu.menuCode == 0).then((photo) {
                      if (photo != null) {
                        setState(() {
                          workImageWidget = Image.file(
                            File(photo.path),
                            width: 180.w,
                            height: 120.h,
                          );
                          upLoadImg(photo, false);
                        });
                      }
                    });
                  });
                },
                child: SizedBox(
                    child: Container(
                        width: 272.w, height: 174.h, child: workImageWidget))),
            Container(
              height: 19.h,
            ),
            TextView(
              S.of(context).take_photo_tip,
              color: N.black36,
            ),
            Container(
              height: 19.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(S.of(context).payroll, color: N.gray9B),
                TextView(
                  S.of(context).work_permit,
                  color: N.gray9B,
                ),
                TextView(
                  S.of(context).driving_license,
                  color: N.gray9B,
                ),
                TextView(
                  S.of(context).work_place_photo,
                  color: N.gray9B,
                )
              ],
            ),
            Container(
              height: 25.h,
            ),
            ButtonView(S.current.next_tip, () {
              context.startTo(NUserInfoWidget.routeName);
            }),

            Container(height: 16.h,),
            buildPPWidget(S.of(context).rade_success,S.of(context).loanAgreement,(isCheck){
              isLoanAgreement=isCheck;
            }),
            Container(height: 16.h,),
            buildPPWidget(S.of(context).rade_success,S.of(context).dislosureStatement,(isCheck){
              isDislosure=isCheck;
            }),

            Container(
              height: 46.h,
            ),
          ],
        ),
      ),
    );
  }

  void showSelectPhotoDialog(BuildContext context, onDialogClick) async {
    String title = S.of(context).choose_get_photo;
    List<MenuItem> lists = [
      MenuItem(0, 0, S.of(context).photograph),
      MenuItem(1, 1, S.of(context).select_album)
    ];
    showListPop(context, title, lists, onDialogClick);
  }

  Future<XFile?> selectPhoto(bool isCamera) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo;
    if (isCamera) {
      photo = await _picker.pickImage(
        maxWidth: 640,
        maxHeight: 480,
        source: ImageSource.camera,
      );
    } else {
      photo = await _picker.pickImage(
        maxWidth: 640,
        maxHeight: 480,
        source: ImageSource.gallery,
      );
    }

    return photo;
  }

  Future<Map<String, dynamic>?> getFileMap(String path, bool isIdCard) async {
    Map<String, dynamic> fileMap = {};
    fileMap["user_id"] = await SPData.get(SPKey.USERID.toString(), "");
    fileMap["file_type"] = isIdCard ? "1" : "4";
    Slog.d("fileMap  $fileMap");
    fileMap["file"] =
        await MultipartFile.fromFile(path, filename: path.split("/").last);
    return fileMap.create;
  }

  void upLoadImg(XFile photo, bool isIdCard) {
    getFileMap(photo.path, isIdCard).then((value) {
      Slog.d("图片map 拼接完毕  "+photo.path);
      Slog.d("图片map 拼接完毕  "+photo.name);

      photo.length().then((value) {
        Slog.d("图片map 拼接完毕 $value ");
      });
      upload(value!).then((result) {
        var JsonResult = EmptyReslut.fromJson(result);
        Slog.d("图片上传返回  $JsonResult");
        if (JsonResult.code != "200") {
          toast(JsonResult.message);
        } else {
          isIdCard ? isIdUpload : isWorkUpload = true;
          Slog.d("标记是否上传  isIdUpload $isIdUpload  isWorkUpload $isWorkUpload");
        }
      });
    });
  }
}

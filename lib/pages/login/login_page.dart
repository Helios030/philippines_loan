import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/sms.dart';
import 'package:philippines_loan/pages/home/home_screen.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/input_text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/ncolors.dart';
import 'package:philippines_loan/utils/sp_key.dart';
import '../../resource.dart';
import 'package:philippines_loan/utils/af_utils.dart';
import 'package:philippines_loan/utils/sp_data.dart';

class NLoginPage extends StatefulWidget {
  static String routeName = "/login";

  @override
  State<NLoginPage> createState() => _NLoginPageState();
}

class _NLoginPageState extends State<NLoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeScreenWidget());
  }
}

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

String count = S.current.getVCode;

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  Timer? timer;
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  bool isTiming = false;
  FocusNode commentFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: (nimg_bg),
            fit: BoxFit.fill, /* 完全填充*/
          )),
        ),
        Container(
          padding: EdgeInsets.only(top: 170.h, left: 18.w, right: 18.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputTextView(
                  S.of(context).phone_number, phoneController, (value) {},
                  tt: TextInputType.number),
              Container(
                height: 20.h,
              ),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  InputTextView(S.of(context).vCode, codeController, (value) {},
                      tt: TextInputType.number,length: 6,),
                  TextButton(
                    child: Text(count,
                        style: TextStyle(color: const Color(0xFFFD696B))),
                    onPressed: () {
                      if (isTiming) {
                        return;
                      }
                      String text = phoneController.text;
                      if (text == "") {
                        toast(S.of(context).please_input);
                      } else {
                        FocusScope.of(context).requestFocus(commentFocus);
                        FocusScope.of(context).unfocus();

                        Map<String, String> dataMap = {};
                        dataMap["phone"] = text;
                        dataMap["type"] = "2";
                        request(UriPath.sendSms, dataMap).then((value) {
                          if (value != null) {
                            toast(S.of(context).send_success);
                            var currTime = 60;
                            timer = Timer.periodic(const Duration(seconds: 1),
                                (timer) {
                              isTiming = true;
                              currTime--;
                              count = "$currTime s";
                              if (currTime == 0) {
                                count = S.current.getVCode;
                                timer.cancel();
                                isTiming = false;
                                currTime = 60;
                              }
                              setState(() {});
                            });
                          }
                        });
                      }
                    },
                  )
                ],
              ),
              Container(
                height: 49.h,
              ),
              ButtonView(S.current.login, () {
                Map<String, String> dataMap = {};
                dataMap["phone"] = phoneController.text;
                dataMap["vcode"] = codeController.text;
                dataMap["socialType"] = "";
                dataMap["socialId"] = "";

                request(UriPath.smsLogin, dataMap).then((response) {
                  if (response != null) {
                    var value = SmsReslut.fromJson(response);
                    sp_data.put(SPKey.USERID.toString(), value.result!.userId);
                    sp_data.put(
                        SPKey.REALNAME.toString(), value.result!.realName);
                    sp_data.put(SPKey.PHONE.toString(), value.result!.phone);
                    sp_data.put(
                        SPKey.PHONEPRE.toString(), value.result!.phonepre);
                    toast(S.of(context).login);

                    if (value.result!.register == false) {
                      trackRegisterEvent(value.result!.phone!);
                    }
                    trackLoginEvent(value.result!.phone!);
                    Navigator.pop(context);
                    Navigator.pushNamed(context, NHomePage.routeName);
                  }
                });
              })
            ],
          ),
        )
      ],
    );
  }
}

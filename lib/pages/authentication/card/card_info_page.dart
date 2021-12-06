import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philippines_loan/generated/l10n.dart';
import 'package:philippines_loan/model/empty_result.dart';
import 'package:philippines_loan/model/s_card_info_result.dart';
import 'package:philippines_loan/pages/authentication/idcard/id_card_page.dart';
import 'package:philippines_loan/pages/authentication/work/work_info_page.dart';
import 'package:philippines_loan/pages/face/face_detect.dart';
import 'package:philippines_loan/pages/widgets/button_view.dart';
import 'package:philippines_loan/pages/widgets/comm_widget.dart';
import 'package:philippines_loan/pages/widgets/edit_view.dart';
import 'package:philippines_loan/pages/widgets/item_text_view.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/af_utils.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/sp_key.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/utils.dart';
import '../../../resource.dart';
import 'package:philippines_loan/utils/slog.dart';

var cardDataMap = <String, dynamic>{};

class NCardInfoWidget extends StatefulWidget {
  static String routeName = "/card_info";

  const NCardInfoWidget({Key? key}) : super(key: key);

  @override
  State<NCardInfoWidget> createState() => _NCardInfoWidgetState();
}

class _NCardInfoWidgetState extends State<NCardInfoWidget> {
  var bankNumberCTL = TextEditingController();
  var bankPhoneCTL = TextEditingController();
  var withdrawal_method = S.current.please_check;

  SCardInfoFesult? sCardInfo;


  @override
  void initState() {
    super.initState();


    //  获取服务器保存数据
    SPData.get(SPKey.USERID.toString(), "").then((id) {
      Map<String, dynamic> dataMap = {};
      dataMap["user_id"] = id;
      cardDataMap["user_id"] = id;
      request(UriPath.queryUsercard, dataMap).then((value) {
        var s_card_info_result = S_card_info_result.fromJson(value);
        if (s_card_info_result.code == "200") {
          sCardInfo = s_card_info_result.result;


          if (sCardInfo!.cardNo.isNotNull()) {
            bankNumberCTL = getCTL(sCardInfo!.cardNo!);
          }
          if (sCardInfo!.bankName.isNotNull()) {
            withdrawal_method = sCardInfo!.bankName!;
          }


          if (sCardInfo!.cardPhone.isNotNull()) {
            bankPhoneCTL =getCTL(sCardInfo!.cardPhone!);
          }


          setMapForResult(sCardInfo);
          setState(() {});
        } else {
          toast(s_card_info_result.message);
        }
      });
    });

  }




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBarWidget(S.current.my_info),
          Container(
              margin: EdgeInsets.only(bottom: 31.h),
              height: 58.h,
              width: 375.w,
              child: Image(
                image: nimg_progress_f,
                fit: BoxFit.fill,
              )),
          Container(
              margin: EdgeInsets.only(left: 18.w, right: 18.w),
              child: Column(children: [
                ItemTextView(S.of(context).withdrawal_method, withdrawal_method,
                    onBank: (menu) {
                  cardDataMap['bank_code'] = menu.menuCode;
                  withdrawal_method = menu.menuName;
                }),
                EditTextView(S.current.bank_account, (text) {
                  cardDataMap['card_no'] = text;
                }, bankNumberCTL),
                EditTextView(S.of(context).bank_phone, (text) {
                  cardDataMap['card_phone'] = text;
                }, bankPhoneCTL),
                ButtonView(S.current.next_tip, () {
                  // context.startTo(NFaceDetectorWidget.routeName);

                  uploadCardInfo();
                }),
                Container(
                  height: 25.h,
                ),
              ]))
        ],
      ),
    );
  }

  Future<void> uploadCardInfo() async {
    var id = await SPData.get(SPKey.USERID.toString(), "");
    var name = await SPData.get(SPKey.REALNAME.toString(), "NULL");

    cardDataMap["accountBankType"] = "1";
    cardDataMap["user_id"] = id;
    cardDataMap["card_hold_name"] = name;

    request(UriPath.userCard, cardDataMap).then((value) {
      var result = EmptyReslut.fromJson(value);
      if (result.isSuccess()) {
        //首页进入
        SPData.get(SPKey.ISMAIN.toString(), true).then((value) {
          if (value) {
            trackAFBankSuccessEvent();
            Navigator.pop(context);
            context.startTo(NIdCardPage.routeName);
          } else {
            Navigator.pop(context);
          }
        });
      } else {
        toast(result.message);
        Slog.d("上传失败  == $result ");
      }
    });
  }

    void setMapForResult(SCardInfoFesult? it) {
      if (it != null) {
        cardDataMap["accountBankType"] = "1";
        cardDataMap["card_hold_name"] = it.cardHoldName;
        cardDataMap["card_no"] = it.cardNo;
        cardDataMap["card_phone"] = it.cardPhone;
        cardDataMap["bank_code"] = it.bankCode;
      }
    }

}

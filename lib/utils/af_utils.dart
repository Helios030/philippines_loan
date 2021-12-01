import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';

import '../application.dart';
import 'constant.dart';
import 'slog.dart';

trackAFActivationEvent() => getAF().logEvent(AF_APP_ACTIVATION, {});

trackAFBankSuccessEvent() => getAF().logEvent(AF_SUBMIT_BANK_SUCCESS, {});

trackClickVaEvent(String mobile) => getAF().logEvent(
    AF_CLICK_VA, {"mobile": mobile, "event_code": EVENT_CODE_CLICK_VA});

trackVaSuccessEvent(String mobile) => getAF().logEvent(
    AF_VA_SUCCESS, {"mobile": mobile, "event_code": EVENT_CODE_VA_SUCCESS});

trackLoginEvent(String mobile) {
  var map = {"mobile": mobile, "event_code": EVENT_CODE_LOGIN};
  getAF().logEvent(AF_APP_LOGIN, map);
  uploadServiceEvent(map);
}

trackRegisterEvent(String mobile) {
  var map = {"mobile": mobile, "event_code": EVENT_NEW_REGISTER};
  getAF().logEvent(AF_APP_REGISTER, map);
  uploadServiceEvent(map);
}

trackInstallEvent() {
  var map = {
    "event_code": EVENT_CODE_INSTALL,
    "mobile": "",
  };
  getAF().logEvent(AF_APP_INSTALL, map);

  uploadServiceEvent(map);
}

trackCommitLoanSuccessEvent(String mobile, String loanId) {
  var map = {
    "mobile": mobile,
    "event_code": EVENT_CODE_APPLY_SUCCESS,
    "loan_id": loanId,
  };
  getAF().logEvent(AF_APPPLY_SUCCESS, map);

  uploadServiceEvent(map);
}

uploadServiceEvent(Map<String, String?> map) async {
  slog.d("开始上传 uploadServiceEvent ${map} ");
  var sdk = getAF();
  var appsFlyerUID = await sdk.getAppsFlyerUID();
  map["appsflyer_id"] = appsFlyerUID;
  sdk.onInstallConversionData((res) {
    res["payload"].forEach((key, value) {
      map[key] = value.toString();
    });
    request(UriPath.appsFlyer, map).then((value) {
      slog.d("手动Event 上传 map $map ");
    });
  });
}

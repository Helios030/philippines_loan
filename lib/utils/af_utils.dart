import '../application.dart';
import '../main.dart';
import 'constant.dart';


trackAFActivationEvent() =>getAF().logEvent(AF_APP_ACTIVATION, {});

trackAFBankSuccessEvent() =>getAF().logEvent(AF_SUBMIT_BANK_SUCCESS, {});

trackClickVaEvent(String mobile)=>getAF().logEvent(AF_CLICK_VA, {"mobile":mobile,"event_code":EVENT_CODE_CLICK_VA});

trackVaSuccessEvent(String mobile) =>getAF().logEvent(AF_VA_SUCCESS, {"mobile":mobile,"event_code":EVENT_CODE_VA_SUCCESS});

trackLoginEvent(String mobile) =>getAF().logEvent(AF_APP_LOGIN, {"mobile":mobile,"event_code":EVENT_CODE_LOGIN});

trackRegisterEvent(String mobile) => getAF().logEvent(AF_APP_REGISTER, {"mobile":mobile,"event_code":EVENT_NEW_REGISTER});

trackInstallEvent() =>getAF().logEvent(AF_APP_INSTALL, {"event_code":EVENT_CODE_INSTALL});

trackCommitLoanSuccessEvent(String mobile,String loanId)=>getAF().logEvent(AF_APPPLY_SUCCESS, {"mobile":mobile,"event_code":EVENT_CODE_APPLY_SUCCESS,"loan_id":loanId,});


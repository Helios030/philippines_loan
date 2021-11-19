class HttpConfig {
  static const String baseURL = "http://api.th.golden-union.top/api/";
  static const int timeout = 60000;
}

class UriPath{
  static const String sendSms = "register/app/sendSms";
  static const String smsLogin = "login/v2/smsLogin";
  static const String queryloanstatus = "loan/queryloanstatus";
  static const String userStatus = "user/userStatus";
  static const String config = "user/config";
  static const String queryRegion = "query/queryRegion";
  static const String userWork = "user/userWork";
  static const String userContact = "user/userContact";
  static const String bankcode = "query/bankcode";
  static const String userCard = "user/userCard";
  static const String idCardOcr = "user/idCardOcr";
  static const String userBase = "user/userBase";
  static const String license = "user/license";
  static const String queryproducts2 = "loan/queryproducts2";
  static const String queryUserwork = "user/queryUserwork";
  static const String confirm = "loan/confirm";
  static const String loanapp = "loan/v2/loanapp";
  static const String queryUserContact = "user/queryUserContact";
  static const String loanappquery = "loan/loanappquery";
  static const String downoknotify = "comm/downoknotify";
  static const String queryUsercard = "user/queryUsercard";
  static const String queryUserBase = "user/queryUserBase";
  static const String getva = "loan/getva";
  static const String getVaInfo = "loan/getVaInfo";
  static const String vouch = "loan/repay/vouch";
  static const String addressbook = "fetch/user/addressbook";
  static const String device = "fetch/user/device";
  static const String position = "fetch/user/position";
  static const String message = "fetch/user/message";
  static const String socialLogin = "login/socialLogin";
  static const String queryuserMedia = "user/queryuserMedia";
  static const String reloanapp = "loan/re/loanapp";

}
   class PackConfig{
 static String appName="Rich Money";
 static String packageName="com.neutron.richmoney";
 static String version="1.0";
 static String buildNumber="";
 static String uuid="null";

 @override
  String toString() {
    return 'PackConfig{ appName$appName  packageName $packageName version $version  buildNumber $buildNumber uuid $uuid }';
 }
}
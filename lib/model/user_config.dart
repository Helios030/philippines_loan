/// code : "200"
/// sign : "d0b5c1dc8276a910c630863fb8a97e65"
/// result : {"about_us":"https://www.baidu.com/","default_amount":"5,000","duration":null,"facebook_login_use":"2","hot_tel":"0824737306","k_private":"https://www.baidu.com/","line":"","loan_agree":"https://www.baidu.com/","reApplyFace":false,"riskReportBackImg":"https://m/yuenan/risk_report_80000.png","sensitive_words_version":"v1.0.2","switch":false,"term_of_use":"http://192.168.32.36/IndonesiaMobile/SyaratPenggunaan.html"}
/// message : ""

class Userconfig {
  Userconfig({
      String? code, 
      String? sign, 
      Result? result, 
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}

  Userconfig.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
    _message = json['message'];
  }
  String? _code;
  String? _sign;
  Result? _result;
  String? _message;

  String? get code => _code;
  String? get sign => _sign;
  Result? get result => _result;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['sign'] = _sign;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// about_us : "https://www.baidu.com/"
/// default_amount : "5,000"
/// duration : null
/// facebook_login_use : "2"
/// hot_tel : "0824737306"
/// k_private : "https://www.baidu.com/"
/// line : ""
/// loan_agree : "https://www.baidu.com/"
/// reApplyFace : false
/// riskReportBackImg : "https://m/yuenan/risk_report_80000.png"
/// sensitive_words_version : "v1.0.2"
/// switch : false
/// term_of_use : "http://192.168.32.36/IndonesiaMobile/SyaratPenggunaan.html"

class Result {
  Result({
      String? aboutUs, 
      String? defaultAmount, 
      dynamic duration, 
      String? facebookLoginUse, 
      String? hotTel, 
      String? kPrivate, 
      String? line, 
      String? loanAgree, 
      bool? reApplyFace, 
      String? riskReportBackImg, 
      String? sensitiveWordsVersion, 
      bool? switchb,
      String? termOfUse,}){
    _aboutUs = aboutUs;
    _defaultAmount = defaultAmount;
    _duration = duration;
    _facebookLoginUse = facebookLoginUse;
    _hotTel = hotTel;
    _kPrivate = kPrivate;
    _line = line;
    _loanAgree = loanAgree;
    _reApplyFace = reApplyFace;
    _riskReportBackImg = riskReportBackImg;
    _sensitiveWordsVersion = sensitiveWordsVersion;
    _switch = switchb;
    _termOfUse = termOfUse;
}

  Result.fromJson(dynamic json) {
    _aboutUs = json['about_us'];
    _defaultAmount = json['default_amount'];
    _duration = json['duration'];
    _facebookLoginUse = json['facebook_login_use'];
    _hotTel = json['hot_tel'];
    _kPrivate = json['k_private'];
    _line = json['line'];
    _loanAgree = json['loan_agree'];
    _reApplyFace = json['reApplyFace'];
    _riskReportBackImg = json['riskReportBackImg'];
    _sensitiveWordsVersion = json['sensitive_words_version'];
    _switch = json['switch'];
    _termOfUse = json['term_of_use'];
  }
  String? _aboutUs;
  String? _defaultAmount;
  dynamic _duration;
  String? _facebookLoginUse;
  String? _hotTel;
  String? _kPrivate;
  String? _line;
  String? _loanAgree;
  bool? _reApplyFace;
  String? _riskReportBackImg;
  String? _sensitiveWordsVersion;
  bool? _switch;
  String? _termOfUse;
  String? get aboutUs => _aboutUs;
  String? get defaultAmount => _defaultAmount;
  dynamic get duration => _duration;
  String? get facebookLoginUse => _facebookLoginUse;
  String? get hotTel => _hotTel;
  String? get kPrivate => _kPrivate;
  String? get line => _line;
  String? get loanAgree => _loanAgree;
  bool? get reApplyFace => _reApplyFace;
  String? get riskReportBackImg => _riskReportBackImg;
  String? get sensitiveWordsVersion => _sensitiveWordsVersion;
  bool? get switchb => _switch;
  String? get termOfUse => _termOfUse;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['about_us'] = _aboutUs;
    map['default_amount'] = _defaultAmount;
    map['duration'] = _duration;
    map['facebook_login_use'] = _facebookLoginUse;
    map['hot_tel'] = _hotTel;
    map['k_private'] = _kPrivate;
    map['line'] = _line;
    map['loan_agree'] = _loanAgree;
    map['reApplyFace'] = _reApplyFace;
    map['riskReportBackImg'] = _riskReportBackImg;
    map['sensitive_words_version'] = _sensitiveWordsVersion;
    map['switch'] = _switch;
    map['term_of_use'] = _termOfUse;
    return map;
  }

}
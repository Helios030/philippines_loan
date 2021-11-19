/// code : "200"
/// bank_name : null
/// sign : "78cf5b6f59eda64ac0d068b577aa71a1"
/// result : [{"bank_code":"16","bank_icon":"https://thail.oss-cn-hongkong.aliyuncs.com/bank/16.png","bank_name":"iBANK"},{"bank_code":"18","bank_icon":"https://thail.oss-cn-hongkong.aliyuncs.com/bank/18.png","bank_name":"ICBC"},{"bank_code":"19","bank_icon":"https://thail.oss-cn-hongkong.aliyuncs.com/bank/19.png","bank_name":"TCR"},{"bank_code":"20","bank_icon":"https://thail.oss-cn-hongkong.aliyuncs.com/bank/20.png","bank_name":"SMBC"},{"bank_code":"21","bank_icon":"https://thail.oss-cn-hongkong.aliyuncs.com/bank/21.png","bank_name":"HSBC"},{"bank_code":"BAAC","bank_icon":"https://thail.oss-cn-hongkong.aliyuncs.com/bank/25.png","bank_name":"BAAC"}]
/// message : ""

class S_bank_list_result {
  S_bank_list_result({
      String? code, 
      dynamic bankName, 
      String? sign, 
      List<SBankListResult>? result,
      String? message,}){
    _code = code;
    _bankName = bankName;
    _sign = sign;
    _result = result;
    _message = message;
}

  S_bank_list_result.fromJson(dynamic json) {
    _code = json['code'];
    _bankName = json['bank_name'];
    _sign = json['sign'];
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(SBankListResult.fromJson(v));
      });
    }
    _message = json['message'];
  }
  String? _code;
  dynamic _bankName;
  String? _sign;
  List<SBankListResult>? _result;
  String? _message;

  String? get code => _code;
  dynamic get bankName => _bankName;
  String? get sign => _sign;
  List<SBankListResult>? get result => _result;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['bank_name'] = _bankName;
    map['sign'] = _sign;
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// bank_code : "16"
/// bank_icon : "https://thail.oss-cn-hongkong.aliyuncs.com/bank/16.png"
/// bank_name : "iBANK"

class SBankListResult {
  SBankListResult({
      String? bankCode, 
      String? bankIcon, 
      String? bankName,}){
    _bankCode = bankCode;
    _bankIcon = bankIcon;
    _bankName = bankName;
}



  SBankListResult.fromJson(dynamic json) {
    _bankCode = json['bank_code'];
    _bankIcon = json['bank_icon'];
    _bankName = json['bank_name'];
  }

  @override
  String toString() {
    return 'SBankListResult{_bankCode: $_bankCode, _bankIcon: $_bankIcon, _bankName: $_bankName}';
  }

  String? _bankCode;
  String? _bankIcon;
  String? _bankName;

  String? get bankCode => _bankCode;
  String? get bankIcon => _bankIcon;
  String? get bankName => _bankName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bank_code'] = _bankCode;
    map['bank_icon'] = _bankIcon;
    map['bank_name'] = _bankName;
    return map;
  }

}
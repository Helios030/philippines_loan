/// code : "200"
/// sign : "96db97743281e557fc5f06229902df16"
/// result : [{"bank_code":"BANANA","bank_icon":null,"bank_name":"BANANA"},{"bank_code":"OFFLINE","bank_icon":"","bank_name":"OFFLINE"}]
/// message : ""

class S_bank_result {
  S_bank_result({
      String? code, 
      String? sign, 
      List<SBankResult>? result,
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}

  S_bank_result.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(SBankResult.fromJson(v));
      });
    }
    _message = json['message'];
  }
  String? _code;
  String? _sign;
  List<SBankResult>? _result;
  String? _message;

  String? get code => _code;
  String? get sign => _sign;
  List<SBankResult>? get result => _result;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['sign'] = _sign;
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// bank_code : "BANANA"
/// bank_icon : null
/// bank_name : "BANANA"

class SBankResult {
  SBankResult({
      String? bankCode, 
      dynamic bankIcon, 
      String? bankName,}){
    _bankCode = bankCode;
    _bankIcon = bankIcon;
    _bankName = bankName;
}


  @override
  String toString() {
    return 'SBankResult{_bankCode: $_bankCode, _bankIcon: $_bankIcon, _bankName: $_bankName}';
  }

  SBankResult.fromJson(dynamic json) {
    _bankCode = json['bank_code'];
    _bankIcon = json['bank_icon'];
    _bankName = json['bank_name'];
  }
  String? _bankCode;
  dynamic _bankIcon;
  String? _bankName;

  String? get bankCode => _bankCode;
  dynamic get bankIcon => _bankIcon;
  String? get bankName => _bankName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bank_code'] = _bankCode;
    map['bank_icon'] = _bankIcon;
    map['bank_name'] = _bankName;
    return map;
  }

}
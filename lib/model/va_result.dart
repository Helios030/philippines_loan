/// code : "200"
/// sign : "6a95e7647ca3e33259a150f9b8410dad"
/// result : {"account_name":"ThanvaratChusantl","amount":"5500.00","bank_city_name":null,"bank_link":null,"bank_name":"ICBC","branch_bank_name":null,"endTime":null,"guide_url":"https://kxy-test.oss-cn-hongkong.aliyuncs.com/qr_code/1632709832_1632709832538-01632709832539b7b6733854a1cfda6ae7e4a50f9bfb2.jpg","pay_no":null,"service_fee":null,"startTime":null,"uniqueId":"nwd7HJ","va":"6213672001126909"}
/// message : ""

class Va_result {
  Va_result({
      String? code, 
      String? sign, 
      VAResult? result,
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}

  Va_result.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = json['result'] != null ? VAResult.fromJson(json['result']) : null;
    _message = json['message'];
  }
  String? _code;
  String? _sign;
  VAResult? _result;
  String? _message;

  String? get code => _code;
  String? get sign => _sign;
  VAResult? get result => _result;
  String? get message => _message;


  @override
  String toString() {
    return 'Va_result{_code: $_code, _sign: $_sign, _result: $_result, _message: $_message}';
  }

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

/// account_name : "ThanvaratChusantl"
/// amount : "5500.00"
/// bank_city_name : null
/// bank_link : null
/// bank_name : "ICBC"
/// branch_bank_name : null
/// endTime : null
/// guide_url : "https://kxy-test.oss-cn-hongkong.aliyuncs.com/qr_code/1632709832_1632709832538-01632709832539b7b6733854a1cfda6ae7e4a50f9bfb2.jpg"
/// pay_no : null
/// service_fee : null
/// startTime : null
/// uniqueId : "nwd7HJ"
/// va : "6213672001126909"

class VAResult {
  VAResult({
      String? accountName, 
      String? amount, 
      dynamic bankCityName, 
      dynamic bankLink, 
      String? bankName, 
      dynamic branchBankName, 
      dynamic endTime, 
      String? guideUrl, 
      dynamic payNo, 
      dynamic serviceFee, 
      dynamic startTime, 
      String? uniqueId, 
      String? va,}){
    _accountName = accountName;
    _amount = amount;
    _bankCityName = bankCityName;
    _bankLink = bankLink;
    _bankName = bankName;
    _branchBankName = branchBankName;
    _endTime = endTime;
    _guideUrl = guideUrl;
    _payNo = payNo;
    _serviceFee = serviceFee;
    _startTime = startTime;
    _uniqueId = uniqueId;
    _va = va;
}




  @override
  String toString() {
    return 'VAResult{_accountName: $_accountName, _amount: $_amount, _bankCityName: $_bankCityName, _bankLink: $_bankLink, _bankName: $_bankName, _branchBankName: $_branchBankName, _endTime: $_endTime, _guideUrl: $_guideUrl, _payNo: $_payNo, _serviceFee: $_serviceFee, _startTime: $_startTime, _uniqueId: $_uniqueId, _va: $_va}';
  }

  VAResult.fromJson(dynamic json) {
    _accountName = json['account_name'];
    _amount = json['amount'];
    _bankCityName = json['bank_city_name'];
    _bankLink = json['bank_link'];
    _bankName = json['bank_name'];
    _branchBankName = json['branch_bank_name'];
    _endTime = json['endTime'];
    _guideUrl = json['guide_url'];
    _payNo = json['pay_no'];
    _serviceFee = json['service_fee'];
    _startTime = json['startTime'];
    _uniqueId = json['uniqueId'];
    _va = json['va'];
  }
  String? _accountName;
  String? _amount;
  dynamic _bankCityName;
  dynamic _bankLink;
  String? _bankName;
  dynamic _branchBankName;
  dynamic _endTime;
  String? _guideUrl;
  dynamic _payNo;
  dynamic _serviceFee;
  dynamic _startTime;
  String? _uniqueId;
  String? _va;

  String? get accountName => _accountName;
  String? get amount => _amount;
  dynamic get bankCityName => _bankCityName;
  dynamic get bankLink => _bankLink;
  String? get bankName => _bankName;
  dynamic get branchBankName => _branchBankName;
  dynamic get endTime => _endTime;
  String? get guideUrl => _guideUrl;
  dynamic get payNo => _payNo;
  dynamic get serviceFee => _serviceFee;
  dynamic get startTime => _startTime;
  String? get uniqueId => _uniqueId;
  String? get va => _va;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account_name'] = _accountName;
    map['amount'] = _amount;
    map['bank_city_name'] = _bankCityName;
    map['bank_link'] = _bankLink;
    map['bank_name'] = _bankName;
    map['branch_bank_name'] = _branchBankName;
    map['endTime'] = _endTime;
    map['guide_url'] = _guideUrl;
    map['pay_no'] = _payNo;
    map['service_fee'] = _serviceFee;
    map['startTime'] = _startTime;
    map['uniqueId'] = _uniqueId;
    map['va'] = _va;
    return map;
  }

}
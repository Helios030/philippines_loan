/// code : "200"
/// sign : "199843f71290774b6540adbca94524c7"
/// result : {"amount":2000,"amount2Account":"1,000","bank_name":"SCBT","card_no":"999555959369","duration":7,"fee":"50%","mobile":"017629047825","no_ktp":"1420300061123","overdue_penalty":"2%","pay":"25%","paymentAmount":"2,000","penalty":"5%","rate":"0.05%","real_name":"นาย เอนก ลันระนา","risk":"10%","service":"15%"}
/// message : ""

class S_confirm_info {
  S_confirm_info({
      String? code, 
      String? sign, 
      SConfirmResult? result,
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}

  S_confirm_info.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = json['result'] != null ? SConfirmResult.fromJson(json['result']) : null;
    _message = json['message'];
  }
  String? _code;
  String? _sign;
  SConfirmResult? _result;
  String? _message;

  String? get code => _code;
  String? get sign => _sign;
  SConfirmResult? get result => _result;
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

/// amount : 2000
/// amount2Account : "1,000"
/// bank_name : "SCBT"
/// card_no : "999555959369"
/// duration : 7
/// fee : "50%"
/// mobile : "017629047825"
/// no_ktp : "1420300061123"
/// overdue_penalty : "2%"
/// pay : "25%"
/// paymentAmount : "2,000"
/// penalty : "5%"
/// rate : "0.05%"
/// real_name : "นาย เอนก ลันระนา"
/// risk : "10%"
/// service : "15%"

class SConfirmResult {
  SConfirmResult({
      int? amount, 
      String? amount2Account, 
      String? bankName, 
      String? cardNo, 
      int? duration, 
      String? fee, 
      String? mobile, 
      String? noKtp, 
      String? overduePenalty, 
      String? pay, 
      String? paymentAmount, 
      String? penalty, 
      String? rate, 
      String? realName, 
      String? risk, 
      String? service,}){
    _amount = amount;
    _amount2Account = amount2Account;
    _bankName = bankName;
    _cardNo = cardNo;
    _duration = duration;
    _fee = fee;
    _mobile = mobile;
    _noKtp = noKtp;
    _overduePenalty = overduePenalty;
    _pay = pay;
    _paymentAmount = paymentAmount;
    _penalty = penalty;
    _rate = rate;
    _realName = realName;
    _risk = risk;
    _service = service;
}


  @override
  String toString() {
    return 'SConfirmResult{_amount: $_amount, _amount2Account: $_amount2Account, _bankName: $_bankName, _cardNo: $_cardNo, _duration: $_duration, _fee: $_fee, _mobile: $_mobile, _noKtp: $_noKtp, _overduePenalty: $_overduePenalty, _pay: $_pay, _paymentAmount: $_paymentAmount, _penalty: $_penalty, _rate: $_rate, _realName: $_realName, _risk: $_risk, _service: $_service}';
  }

  SConfirmResult.fromJson(dynamic json) {
    _amount = json['amount'];
    _amount2Account = json['amount2Account'];
    _bankName = json['bank_name'];
    _cardNo = json['card_no'];
    _duration = json['duration'];
    _fee = json['fee'];
    _mobile = json['mobile'];
    _noKtp = json['no_ktp'];
    _overduePenalty = json['overdue_penalty'];
    _pay = json['pay'];
    _paymentAmount = json['paymentAmount'];
    _penalty = json['penalty'];
    _rate = json['rate'];
    _realName = json['real_name'];
    _risk = json['risk'];
    _service = json['service'];
  }
  int? _amount;
  String? _amount2Account;
  String? _bankName;
  String? _cardNo;
  int? _duration;
  String? _fee;
  String? _mobile;
  String? _noKtp;
  String? _overduePenalty;
  String? _pay;
  String? _paymentAmount;
  String? _penalty;
  String? _rate;
  String? _realName;
  String? _risk;
  String? _service;

  int? get amount => _amount;
  String? get amount2Account => _amount2Account;
  String? get bankName => _bankName;
  String? get cardNo => _cardNo;
  int? get duration => _duration;
  String? get fee => _fee;
  String? get mobile => _mobile;
  String? get noKtp => _noKtp;
  String? get overduePenalty => _overduePenalty;
  String? get pay => _pay;
  String? get paymentAmount => _paymentAmount;
  String? get penalty => _penalty;
  String? get rate => _rate;
  String? get realName => _realName;
  String? get risk => _risk;
  String? get service => _service;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = _amount;
    map['amount2Account'] = _amount2Account;
    map['bank_name'] = _bankName;
    map['card_no'] = _cardNo;
    map['duration'] = _duration;
    map['fee'] = _fee;
    map['mobile'] = _mobile;
    map['no_ktp'] = _noKtp;
    map['overdue_penalty'] = _overduePenalty;
    map['pay'] = _pay;
    map['paymentAmount'] = _paymentAmount;
    map['penalty'] = _penalty;
    map['rate'] = _rate;
    map['real_name'] = _realName;
    map['risk'] = _risk;
    map['service'] = _service;
    return map;
  }

}
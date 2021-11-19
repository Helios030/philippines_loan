/// code : "200"
/// sign : "75519ead73e9354df366a578c8ac8a2b"
/// result : {"bank_code":"22","bank_name":"SCBT","card_hold_name":"นาย เอนก ลันระนา","card_no":"999555959369","card_phone":"017629047825","phonepre":"66","user_id":"2202107121447324170918"}
/// message : ""

class S_card_info_result {
  S_card_info_result({
      String? code, 
      String? sign, 
      SCardInfoFesult? result,
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}

  S_card_info_result.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = json['result'] != null ? SCardInfoFesult.fromJson(json['result']) : null;
    _message = json['message'];
  }
  String? _code;
  String? _sign;
  SCardInfoFesult? _result;
  String? _message;

  String? get code => _code;
  String? get sign => _sign;
  SCardInfoFesult? get result => _result;
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

/// bank_code : "22"
/// bank_name : "SCBT"
/// card_hold_name : "นาย เอนก ลันระนา"
/// card_no : "999555959369"
/// card_phone : "017629047825"
/// phonepre : "66"
/// user_id : "2202107121447324170918"

class SCardInfoFesult {
  SCardInfoFesult({
      String? bankCode, 
      String? bankName, 
      String? cardHoldName, 
      String? cardNo, 
      String? cardPhone, 
      String? phonepre, 
      String? userId,}){
    _bankCode = bankCode;
    _bankName = bankName;
    _cardHoldName = cardHoldName;
    _cardNo = cardNo;
    _cardPhone = cardPhone;
    _phonepre = phonepre;
    _userId = userId;
}


  @override
  String toString() {
    return 'SCardInfoFesult{_bankCode: $_bankCode, _bankName: $_bankName, _cardHoldName: $_cardHoldName, _cardNo: $_cardNo, _cardPhone: $_cardPhone, _phonepre: $_phonepre, _userId: $_userId}';
  }

  SCardInfoFesult.fromJson(dynamic json) {
    _bankCode = json['bank_code'];
    _bankName = json['bank_name'];
    _cardHoldName = json['card_hold_name'];
    _cardNo = json['card_no'];
    _cardPhone = json['card_phone'];
    _phonepre = json['phonepre'];
    _userId = json['user_id'];
  }
  String? _bankCode;
  String? _bankName;
  String? _cardHoldName;
  String? _cardNo;
  String? _cardPhone;
  String? _phonepre;
  String? _userId;

  String? get bankCode => _bankCode;
  String? get bankName => _bankName;
  String? get cardHoldName => _cardHoldName;
  String? get cardNo => _cardNo;
  String? get cardPhone => _cardPhone;
  String? get phonepre => _phonepre;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bank_code'] = _bankCode;
    map['bank_name'] = _bankName;
    map['card_hold_name'] = _cardHoldName;
    map['card_no'] = _cardNo;
    map['card_phone'] = _cardPhone;
    map['phonepre'] = _phonepre;
    map['user_id'] = _userId;
    return map;
  }

}
/// code : "200"
/// sign : "fa60eb3c4f1d2ce3207b41ff41522141"
/// result : {"card_status":"1","comp_status":"1","contact_status":"1","file_status1":"1","file_status2":"0","file_status3":"0","file_status4":"0","file_status5":"0","file_status6":"0","file_status7":"0","file_status8":"0","file_status9":"0","first_half":"2","goole_facebook_status":"0","loan_status":"1","person_status":"1","pic_status":"1","pic_status2":"0","pic_status3":"0","pic_status4":"0","pic_status5":"0","pic_status6":"0","second_half":"2"}
/// message : ""

class S_user_state_result {
  S_user_state_result({
      String? code, 
      String? sign, 
      SUserStateResult? result,
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}

  S_user_state_result.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = json['result'] != null ? SUserStateResult.fromJson(json['result']) : null;
    _message = json['message'];
  }
  String? _code;
  String? _sign;
  SUserStateResult? _result;
  String? _message;

  String? get code => _code;
  String? get sign => _sign;
  SUserStateResult? get result => _result;
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

/// card_status : "1"
/// comp_status : "1"
/// contact_status : "1"
/// file_status1 : "1"
/// file_status2 : "0"
/// file_status3 : "0"
/// file_status4 : "0"
/// file_status5 : "0"
/// file_status6 : "0"
/// file_status7 : "0"
/// file_status8 : "0"
/// file_status9 : "0"
/// first_half : "2"
/// goole_facebook_status : "0"
/// loan_status : "1"
/// person_status : "1"
/// pic_status : "1"
/// pic_status2 : "0"
/// pic_status3 : "0"
/// pic_status4 : "0"
/// pic_status5 : "0"
/// pic_status6 : "0"
/// second_half : "2"

class SUserStateResult {
  SUserStateResult({
      String? cardStatus, 
      String? compStatus, 
      String? contactStatus, 
      String? fileStatus1, 
      String? fileStatus2, 
      String? fileStatus3, 
      String? fileStatus4, 
      String? fileStatus5, 
      String? fileStatus6, 
      String? fileStatus7, 
      String? fileStatus8, 
      String? fileStatus9, 
      String? firstHalf, 
      String? gooleFacebookStatus, 
      String? loanStatus, 
      String? personStatus, 
      String? picStatus, 
      String? picStatus2, 
      String? picStatus3, 
      String? picStatus4, 
      String? picStatus5, 
      String? picStatus6, 
      String? secondHalf,}){
    _cardStatus = cardStatus;
    _compStatus = compStatus;
    _contactStatus = contactStatus;
    _fileStatus1 = fileStatus1;
    _fileStatus2 = fileStatus2;
    _fileStatus3 = fileStatus3;
    _fileStatus4 = fileStatus4;
    _fileStatus5 = fileStatus5;
    _fileStatus6 = fileStatus6;
    _fileStatus7 = fileStatus7;
    _fileStatus8 = fileStatus8;
    _fileStatus9 = fileStatus9;
    _firstHalf = firstHalf;
    _gooleFacebookStatus = gooleFacebookStatus;
    _loanStatus = loanStatus;
    _personStatus = personStatus;
    _picStatus = picStatus;
    _picStatus2 = picStatus2;
    _picStatus3 = picStatus3;
    _picStatus4 = picStatus4;
    _picStatus5 = picStatus5;
    _picStatus6 = picStatus6;
    _secondHalf = secondHalf;
}


  @override
  String toString() {
    return 'SUserStateResult{_cardStatus: $_cardStatus, _compStatus: $_compStatus, _contactStatus: $_contactStatus, _fileStatus1: $_fileStatus1, _fileStatus2: $_fileStatus2, _fileStatus3: $_fileStatus3, _fileStatus4: $_fileStatus4, _fileStatus5: $_fileStatus5, _fileStatus6: $_fileStatus6, _fileStatus7: $_fileStatus7, _fileStatus8: $_fileStatus8, _fileStatus9: $_fileStatus9, _firstHalf: $_firstHalf, _gooleFacebookStatus: $_gooleFacebookStatus, _loanStatus: $_loanStatus, _personStatus: $_personStatus, _picStatus: $_picStatus, _picStatus2: $_picStatus2, _picStatus3: $_picStatus3, _picStatus4: $_picStatus4, _picStatus5: $_picStatus5, _picStatus6: $_picStatus6, _secondHalf: $_secondHalf}';
  }

  SUserStateResult.fromJson(dynamic json) {
    _cardStatus = json['card_status'];
    _compStatus = json['comp_status'];
    _contactStatus = json['contact_status'];
    _fileStatus1 = json['file_status1'];
    _fileStatus2 = json['file_status2'];
    _fileStatus3 = json['file_status3'];
    _fileStatus4 = json['file_status4'];
    _fileStatus5 = json['file_status5'];
    _fileStatus6 = json['file_status6'];
    _fileStatus7 = json['file_status7'];
    _fileStatus8 = json['file_status8'];
    _fileStatus9 = json['file_status9'];
    _firstHalf = json['first_half'];
    _gooleFacebookStatus = json['goole_facebook_status'];
    _loanStatus = json['loan_status'];
    _personStatus = json['person_status'];
    _picStatus = json['pic_status'];
    _picStatus2 = json['pic_status2'];
    _picStatus3 = json['pic_status3'];
    _picStatus4 = json['pic_status4'];
    _picStatus5 = json['pic_status5'];
    _picStatus6 = json['pic_status6'];
    _secondHalf = json['second_half'];
  }
  String? _cardStatus;
  String? _compStatus;
  String? _contactStatus;
  String? _fileStatus1;
  String? _fileStatus2;
  String? _fileStatus3;
  String? _fileStatus4;
  String? _fileStatus5;
  String? _fileStatus6;
  String? _fileStatus7;
  String? _fileStatus8;
  String? _fileStatus9;
  String? _firstHalf;
  String? _gooleFacebookStatus;
  String? _loanStatus;
  String? _personStatus;
  String? _picStatus;
  String? _picStatus2;
  String? _picStatus3;
  String? _picStatus4;
  String? _picStatus5;
  String? _picStatus6;
  String? _secondHalf;

  String? get cardStatus => _cardStatus;
  String? get compStatus => _compStatus;
  String? get contactStatus => _contactStatus;
  String? get fileStatus1 => _fileStatus1;
  String? get fileStatus2 => _fileStatus2;
  String? get fileStatus3 => _fileStatus3;
  String? get fileStatus4 => _fileStatus4;
  String? get fileStatus5 => _fileStatus5;
  String? get fileStatus6 => _fileStatus6;
  String? get fileStatus7 => _fileStatus7;
  String? get fileStatus8 => _fileStatus8;
  String? get fileStatus9 => _fileStatus9;
  String? get firstHalf => _firstHalf;
  String? get gooleFacebookStatus => _gooleFacebookStatus;
  String? get loanStatus => _loanStatus;
  String? get personStatus => _personStatus;
  String? get picStatus => _picStatus;
  String? get picStatus2 => _picStatus2;
  String? get picStatus3 => _picStatus3;
  String? get picStatus4 => _picStatus4;
  String? get picStatus5 => _picStatus5;
  String? get picStatus6 => _picStatus6;
  String? get secondHalf => _secondHalf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['card_status'] = _cardStatus;
    map['comp_status'] = _compStatus;
    map['contact_status'] = _contactStatus;
    map['file_status1'] = _fileStatus1;
    map['file_status2'] = _fileStatus2;
    map['file_status3'] = _fileStatus3;
    map['file_status4'] = _fileStatus4;
    map['file_status5'] = _fileStatus5;
    map['file_status6'] = _fileStatus6;
    map['file_status7'] = _fileStatus7;
    map['file_status8'] = _fileStatus8;
    map['file_status9'] = _fileStatus9;
    map['first_half'] = _firstHalf;
    map['goole_facebook_status'] = _gooleFacebookStatus;
    map['loan_status'] = _loanStatus;
    map['person_status'] = _personStatus;
    map['pic_status'] = _picStatus;
    map['pic_status2'] = _picStatus2;
    map['pic_status3'] = _picStatus3;
    map['pic_status4'] = _picStatus4;
    map['pic_status5'] = _picStatus5;
    map['pic_status6'] = _picStatus6;
    map['second_half'] = _secondHalf;
    return map;
  }

}
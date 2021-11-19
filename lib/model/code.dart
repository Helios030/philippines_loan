/// code : "200"
/// sign : "071bd8d844f9506119d2b41cfa7d58d2"
/// result : {"phone":"017629047938"}
/// message : ""

class CodeResult {
  CodeResult({
      String? code, 
      String? sign, 
      Result? result, 
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}


  @override
  String toString() {
    return 'Code{_code: $_code, _sign: $_sign, _result: $_result, _message: $_message}';
  }

  CodeResult.fromJson(dynamic json) {
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

/// phone : "017629047938"

class Result {
  Result({
      String? phone,}){
    _phone = phone;
}


  @override
  String toString() {
    return 'Result{_phone: $_phone}';
  }

  Result.fromJson(dynamic json) {
    _phone = json['phone'];
  }
  String? _phone;

  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = _phone;
    return map;
  }

}



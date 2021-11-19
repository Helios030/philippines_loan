/// code : "200"
/// sign : "84d8b345fdaa1fb3143804dd4bad2c10"
/// result : {"loanId":2288}
/// message : ""

class Confirm_result {
  Confirm_result({
      String? code, 
      String? sign, 
      ConfirmResult? result,
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}

  Confirm_result.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = json['result'] != null ? ConfirmResult.fromJson(json['result']) : null;
    _message = json['message'];
  }


  @override
  String toString() {
    return 'Confirm_result{_code: $_code, _sign: $_sign, _result: $_result, _message: $_message}';
  }

  String? _code;
  String? _sign;
  ConfirmResult? _result;
  String? _message;

  String? get code => _code;
  String? get sign => _sign;
  ConfirmResult? get result => _result;
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

/// loanId : 2288

class ConfirmResult {
  ConfirmResult({
      int? loanId,}){
    _loanId = loanId;
}

  ConfirmResult.fromJson(dynamic json) {
    _loanId = json['loanId'];
  }
  int? _loanId;

  int? get loanId => _loanId;


  @override
  String toString() {
    return 'ConfirmResult{_loanId: $_loanId}';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['loanId'] = _loanId;
    return map;
  }

}
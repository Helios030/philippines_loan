import 'dart:convert';

/// code : "200"
/// sign : "292d5126fbf34cf94d683f572a698397"
/// result : {"birthday":"1989-9-22","first_name":"Anek","idNumber":"1420300061123","last_name":"Lanrana","name":"นาย เอนก ลันระนา","sex":"1"}
/// message : ""

class S_idcard_result {
  S_idcard_result({
      String? code,
      String? sign,
      SIdCardResultResult? result,
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}

  S_idcard_result.fromJson(dynamic data) {

    Map<String,dynamic> newJson=json.decode(data);




    _code = newJson["code"];
    _sign = newJson["sign"];
    _result = newJson["result"] != null ? SIdCardResultResult.fromJson(newJson["result"]) : null;
    _message = newJson["message"];
  }
  String? _code;
  String? _sign;
  SIdCardResultResult? _result;
  String? _message;

  String? get code => _code;
  String? get sign => _sign;
  SIdCardResultResult? get result => _result;
  String? get message => _message;


  @override
  String toString() {
    return 'S_idcard_result{_code: $_code, _sign: $_sign, _result: $_result, _message: $_message}';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["code"] = _code;
    map["sign"] = _sign;
    if (_result != null) {
      map["result"] = _result?.toJson();
    }
    map["message"] = _message;
    return map;
  }

}

/// birthday : "1989-9-22"
/// first_name : "Anek"
/// idNumber : "1420300061123"
/// last_name : "Lanrana"
/// name : "นาย เอนก ลันระนา"
/// sex : "1"

class SIdCardResultResult {
  SIdCardResultResult({
      String? birthday,
      String? firstName,
      String? idNumber,
      String? lastName,
      String? name,
      String? sex,}){
    _birthday = birthday;
    _firstName = firstName;
    _idNumber = idNumber;
    _lastName = lastName;
    _name = name;
    _sex = sex;
}


  @override
  String toString() {
    return 'SIdCardResultResult{_birthday: $_birthday, _firstName: $_firstName, _idNumber: $_idNumber, _lastName: $_lastName, _name: $_name, _sex: $_sex}';
  }

  SIdCardResultResult.fromJson(dynamic json) {
    _birthday = json["birthday"];
    _firstName = json["first_name"];
    _idNumber = json["idNumber"];
    _lastName = json["last_name"];
    _name = json["name"];
    _sex = json["sex"];
  }
  String? _birthday;
  String? _firstName;
  String? _idNumber;
  String? _lastName;
  String? _name;
  String? _sex;

  String? get birthday => _birthday;
  String? get firstName => _firstName;
  String? get idNumber => _idNumber;
  String? get lastName => _lastName;
  String? get name => _name;
  String? get sex => _sex;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["birthday"] = _birthday;
    map["first_name"] = _firstName;
    map["idNumber"] = _idNumber;
    map["last_name"] = _lastName;
    map["name"] = _name;
    map["sex"] = _sex;
    return map;
  }

}
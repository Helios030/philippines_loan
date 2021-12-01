class EmptyReslut {
  EmptyReslut({
    String? code,
    String? sign,
    String? message,}){
    _code = code;
    _sign = sign;
    _message = message;
  }

  EmptyReslut.fromJson(dynamic json) {
    _code = json["code"]+"";
    // _sign = json["sign"].toString();
    _message = json["message"].toString();
  }



  String? _code;
  String? _sign;
  String? _message;
  String? get code => _code;
  String? get sign => _sign;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['sign'] = _sign;
    map['message'] = _message;
    return map;
  }

  bool isSuccess() {
    return  (_code =="200");
  }


  @override
  String toString() {
    return 'EmptyReslut{_code: $_code, _sign: $_sign, _message: $_message}';
  }
}
/// code : "200"
/// sign : "ad82cc036c1ece0c6ebc3536763e62ee"
/// result : {"name_relation_1":"阿里巴巴","name_relation_2":"李晨","name_relation_3":"桥宇恒","name_relation_4":null,"phone_relation_1":"057128223456","phone_relation_2":"015353158839","phone_relation_3":"015619217007","phone_relation_4":null,"relation_1":"2","relation_2":"3","relation_3":"3","relation_4":null,"user_id":"2202107121447324170918"}
/// message : ""

class S_contact_result {
  S_contact_result({
      String? code, 
      String? sign, 
      SContactResult? result,
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}

  S_contact_result.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = json['result'] != null ? SContactResult.fromJson(json['result']) : null;
    _message = json['message'];
  }
  String? _code;
  String? _sign;
  SContactResult? _result;
  String? _message;

  String? get code => _code;
  String? get sign => _sign;
  SContactResult? get result => _result;
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

/// name_relation_1 : "阿里巴巴"
/// name_relation_2 : "李晨"
/// name_relation_3 : "桥宇恒"
/// name_relation_4 : null
/// phone_relation_1 : "057128223456"
/// phone_relation_2 : "015353158839"
/// phone_relation_3 : "015619217007"
/// phone_relation_4 : null
/// relation_1 : "2"
/// relation_2 : "3"
/// relation_3 : "3"
/// relation_4 : null
/// user_id : "2202107121447324170918"

class SContactResult {
  SContactResult({
      String? nameRelation1, 
      String? nameRelation2, 
      String? nameRelation3, 
      dynamic nameRelation4, 
      String? phoneRelation1, 
      String? phoneRelation2, 
      String? phoneRelation3, 
      dynamic phoneRelation4, 
      String? relation1, 
      String? relation2, 
      String? relation3, 
      dynamic relation4, 
      String? userId,}){
    _nameRelation1 = nameRelation1;
    _nameRelation2 = nameRelation2;
    _nameRelation3 = nameRelation3;
    _nameRelation4 = nameRelation4;
    _nameRelation5 = nameRelation5;
    _phoneRelation1 = phoneRelation1;
    _phoneRelation2 = phoneRelation2;
    _phoneRelation3 = phoneRelation3;
    _phoneRelation4 = phoneRelation4;
    _phoneRelation5 = phoneRelation5;
    _relation1 = relation1;
    _relation2 = relation2;
    _relation3 = relation3;
    _relation4 = relation4;
    _relation5 = relation5;
    _userId = userId;
}


  @override
  String toString() {
    return 'SContactResult{_nameRelation1: $_nameRelation1, _nameRelation2: $_nameRelation2, _nameRelation3: $_nameRelation3, _nameRelation4: $_nameRelation4, _nameRelation5: $_nameRelation5, _phoneRelation1: $_phoneRelation1, _phoneRelation2: $_phoneRelation2, _phoneRelation3: $_phoneRelation3, _phoneRelation4: $_phoneRelation4, _phoneRelation5: $_phoneRelation5, _relation1: $_relation1, _relation2: $_relation2, _relation3: $_relation3, _relation4: $_relation4, _relation5: $_relation5, _userId: $_userId}';
  }

  SContactResult.fromJson(dynamic json) {
    _nameRelation1 = json['name_relation_1'];
    _nameRelation2 = json['name_relation_2'];
    _nameRelation3 = json['name_relation_3'];
    _nameRelation4 = json['name_relation_4'];
    _nameRelation5 = json['name_relation_5'];
    _phoneRelation1 = json['phone_relation_1'];
    _phoneRelation2 = json['phone_relation_2'];
    _phoneRelation3 = json['phone_relation_3'];
    _phoneRelation4 = json['phone_relation_4'];
    _phoneRelation5 = json['phone_relation_5'];
    _relation1 = json['relation_1'];
    _relation2 = json['relation_2'];
    _relation3 = json['relation_3'];
    _relation4 = json['relation_4'];
    _relation5 = json['relation_5'];
    _userId = json['user_id'];
  }
  String? _nameRelation1;
  String? _nameRelation2;
  String? _nameRelation3;
  dynamic _nameRelation4;
  dynamic _nameRelation5;
  String? _phoneRelation1;
  String? _phoneRelation2;
  String? _phoneRelation3;
  dynamic _phoneRelation4;
  dynamic _phoneRelation5;
  String? _relation1;
  String? _relation2;
  String? _relation3;
  dynamic _relation4;
  dynamic _relation5;
  String? _userId;

  String? get nameRelation1 => _nameRelation1;
  String? get nameRelation2 => _nameRelation2;
  String? get nameRelation3 => _nameRelation3;
  dynamic get nameRelation4 => _nameRelation4;
  dynamic get nameRelation5 => _nameRelation5;
  String? get phoneRelation1 => _phoneRelation1;
  String? get phoneRelation2 => _phoneRelation2;
  String? get phoneRelation3 => _phoneRelation3;
  dynamic get phoneRelation4 => _phoneRelation4;
  dynamic get phoneRelation5 => _phoneRelation5;
  String? get relation1 => _relation1;
  String? get relation2 => _relation2;
  String? get relation3 => _relation3;
  dynamic get relation4 => _relation4;
  dynamic get relation5 => _relation5;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name_relation_1'] = _nameRelation1;
    map['name_relation_2'] = _nameRelation2;
    map['name_relation_3'] = _nameRelation3;
    map['name_relation_4'] = _nameRelation4;
    map['name_relation_5'] = _nameRelation5;
    map['phone_relation_1'] = _phoneRelation1;
    map['phone_relation_2'] = _phoneRelation2;
    map['phone_relation_3'] = _phoneRelation3;
    map['phone_relation_4'] = _phoneRelation4;
    map['phone_relation_5'] = _phoneRelation5;
    map['relation_1'] = _relation1;
    map['relation_2'] = _relation2;
    map['relation_3'] = _relation3;
    map['relation_4'] = _relation4;
    map['relation_5'] = _relation5;
    map['user_id'] = _userId;
    return map;
  }

}
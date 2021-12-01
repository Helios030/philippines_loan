/// code : "200"
/// sign : "470cb8cdc91e039d09890b47c8ab7828"
/// result : {"comp_address":"Jnnn","comp_region_1":"1","comp_region_1_value":"กรุงเทพมหานคร","comp_region_2":"80","comp_region_2_value":"เขตคลองเตย","comp_region_3":null,"comp_region_3_value":null,"comp_region_4":null,"comp_region_4_value":null,"comp_region_value":null,"company_name":"Jbvbhj","company_tel":"17629047898","custemer_type":"4","income_type":"1","industry":"64","pay_date":"วันจันทร์","pay_date_type":"2","position":"1","user_id":"2202107121447324170918"}
/// message : ""

class S_work_info_result {
  S_work_info_result({
      String? code, 
      String? sign, 
      SWorkInfoResult? result,
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}

  S_work_info_result.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = json['result'] != null ? SWorkInfoResult.fromJson(json['result']) : null;
    _message = json['message'];
  }
  String? _code;
  String? _sign;
  SWorkInfoResult? _result;
  String? _message;

  String? get code => _code;
  String? get sign => _sign;
  SWorkInfoResult? get result => _result;
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

/// comp_address : "Jnnn"
/// comp_region_1 : "1"
/// comp_region_1_value : "กรุงเทพมหานคร"
/// comp_region_2 : "80"
/// comp_region_2_value : "เขตคลองเตย"
/// comp_region_3 : null
/// comp_region_3_value : null
/// comp_region_4 : null
/// comp_region_4_value : null
/// comp_region_value : null
/// company_name : "Jbvbhj"
/// company_tel : "17629047898"
/// custemer_type : "4"
/// income_type : "1"
/// industry : "64"
/// pay_date : "วันจันทร์"
/// pay_date_type : "2"
/// position : "1"
/// user_id : "2202107121447324170918"

class SWorkInfoResult {
  SWorkInfoResult({
      String? compAddress, 
      String? compRegion1, 
      String? compRegion1Value, 
      String? compRegion2, 
      String? compRegion2Value, 
      dynamic compRegion3, 
      dynamic compRegion3Value, 
      dynamic compRegion4, 
      dynamic compRegion4Value, 
      dynamic compRegionValue, 
      String? companyName, 
      String? companyTel, 
      String? custemerType, 
      String? incomeType, 
      String? industry, 
      String? payDate, 
      String? payDateType, 
      String? position, 
      String? userId,}){
    _compAddress = compAddress;
    _compRegion1 = compRegion1;
    _compRegion1Value = compRegion1Value;
    _compRegion2 = compRegion2;
    _compRegion2Value = compRegion2Value;
    _compRegion3 = compRegion3;
    _compRegion3Value = compRegion3Value;
    _compRegion4 = compRegion4;
    _compRegion4Value = compRegion4Value;
    _compRegionValue = compRegionValue;
    _companyName = companyName;
    _companyTel = companyTel;
    _custemerType = custemerType;
    _incomeType = incomeType;
    _industry = industry;
    _payDate = payDate;
    _payDateType = payDateType;
    _position = position;
    _userId = userId;
}


  @override
  String toString() {
    return 'SWorkInfoResult{_compAddress: $_compAddress, _compRegion1: $_compRegion1, _compRegion1Value: $_compRegion1Value, _compRegion2: $_compRegion2, _compRegion2Value: $_compRegion2Value, _compRegion3: $_compRegion3, _compRegion3Value: $_compRegion3Value, _compRegion4: $_compRegion4, _compRegion4Value: $_compRegion4Value, _compRegionValue: $_compRegionValue, _companyName: $_companyName, _companyTel: $_companyTel, _custemerType: $_custemerType, _incomeType: $_incomeType, _industry: $_industry, _payDate: $_payDate, _payDateType: $_payDateType, _position: $_position, _userId: $_userId}';
  }

  SWorkInfoResult.fromJson(dynamic json) {
    _compAddress = json['comp_address'];
    _compRegion1 = json['comp_region_1'];
    _compRegion1Value = json['comp_region_1_value'];
    _compRegion2 = json['comp_region_2'];
    _compRegion2Value = json['comp_region_2_value'];
    _compRegion3 = json['comp_region_3'];
    _compRegion3Value = json['comp_region_3_value'];
    _compRegion4 = json['comp_region_4'];
    _compRegion4Value = json['comp_region_4_value'];
    _compRegionValue = json['comp_region_value'];
    _companyName = json['company_name'];
    _companyTel = json['company_tel'];
    _custemerType = json['custemer_type'];
    _incomeType = json['income_type'];
    _industry = json['industry'];
    _payDate = json['pay_date'];
    _payDateType = json['pay_date_type'];
    _position = json['position'];
    _userId = json['user_id'];
  }
  String? _compAddress;
  String? _compRegion1;
  String? _compRegion1Value;
  String? _compRegion2;
  String? _compRegion2Value;
  dynamic _compRegion3;
  dynamic _compRegion3Value;
  dynamic _compRegion4;
  dynamic _compRegion4Value;
  dynamic _compRegionValue;
  String? _companyName;
  String? _companyTel;
  String? _custemerType;
  String? _incomeType;
  String? _industry;
  String? _payDate;
  String? _payDateType;
  String? _position;
  String? _userId;

  String? get compAddress => _compAddress;
  String? get compRegion1 => _compRegion1;
  String? get compRegion1Value => _compRegion1Value;
  String? get compRegion2 => _compRegion2;
  String? get compRegion2Value => _compRegion2Value;
   String? get compRegion3 => _compRegion3;
   String? get compRegion3Value => _compRegion3Value;
   String? get compRegion4 => _compRegion4;
   String? get compRegion4Value => _compRegion4Value;
   String? get compRegionValue => _compRegionValue;
  String? get companyName => _companyName;
  String? get companyTel => _companyTel;
  String? get custemerType => _custemerType;
  String? get incomeType => _incomeType;
  String? get industry => _industry;
  String? get payDate => _payDate;
  String? get payDateType => _payDateType;
  String? get position => _position;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['comp_address'] = _compAddress;
    map['comp_region_1'] = _compRegion1;
    map['comp_region_1_value'] = _compRegion1Value;
    map['comp_region_2'] = _compRegion2;
    map['comp_region_2_value'] = _compRegion2Value;
    map['comp_region_3'] = _compRegion3;
    map['comp_region_3_value'] = _compRegion3Value;
    map['comp_region_4'] = _compRegion4;
    map['comp_region_4_value'] = _compRegion4Value;
    map['comp_region_value'] = _compRegionValue;
    map['company_name'] = _companyName;
    map['company_tel'] = _companyTel;
    map['custemer_type'] = _custemerType;
    map['income_type'] = _incomeType;
    map['industry'] = _industry;
    map['pay_date'] = _payDate;
    map['pay_date_type'] = _payDateType;
    map['position'] = _position;
    map['user_id'] = _userId;
    return map;
  }

}
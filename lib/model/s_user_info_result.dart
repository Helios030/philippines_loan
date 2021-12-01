/// code : "200"
/// sign : "6d2e6c423f6b96eb2fae761633d09b50"
/// result : {"api_version":null,"app_version":null,"birthday":null,"dura_occupancy":null,"education":null,"email":null,"facebook":null,"first_name":"Anek","gender":null,"home_address":null,"home_region_1":null,"home_region_1_value":null,"home_region_2":null,"home_region_2_value":null,"home_region_3":null,"home_region_3_value":null,"home_region_4":null,"home_region_4_value":null,"home_region_value":null,"home_type":null,"idType":0,"imei":null,"last_name":"Lanrana","line":null,"marital_status":null,"middle_name":null,"mobile":"Encryptl+sbmr15PjQooIb8s0un8g==","name_mother":null,"no_ktp":"1420300061123","number_children":null,"pkg_name":null,"real_name":"นาย เอนก ลันระนา","religion":null,"user_id":"2202107161954570311198","uuid":null}
/// message : ""

class S_user_info_result {
  S_user_info_result({
      String? code, 
      String? sign, 
      SUserInfoResult? result,
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}

  S_user_info_result.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = json['result'] != null ? SUserInfoResult.fromJson(json['result']) : null;
    _message = json['message'];
  }
  String? _code;
  String? _sign;
  SUserInfoResult? _result;
  String? _message;

  String? get code => _code;
  String? get sign => _sign;
  SUserInfoResult? get result => _result;
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

/// api_version : null
/// app_version : null
/// birthday : null
/// dura_occupancy : null
/// education : null
/// email : null
/// facebook : null
/// first_name : "Anek"
/// gender : null
/// home_address : null
/// home_region_1 : null
/// home_region_1_value : null
/// home_region_2 : null
/// home_region_2_value : null
/// home_region_3 : null
/// home_region_3_value : null
/// home_region_4 : null
/// home_region_4_value : null
/// home_region_value : null
/// home_type : null
/// idType : 0
/// imei : null
/// last_name : "Lanrana"
/// line : null
/// marital_status : null
/// middle_name : null
/// mobile : "Encryptl+sbmr15PjQooIb8s0un8g=="
/// name_mother : null
/// no_ktp : "1420300061123"
/// number_children : null
/// pkg_name : null
/// real_name : "นาย เอนก ลันระนา"
/// religion : null
/// user_id : "2202107161954570311198"
/// uuid : null

class SUserInfoResult {
  SUserInfoResult({
      dynamic apiVersion, 
      dynamic appVersion, 
      dynamic birthday, 
      dynamic duraOccupancy, 
      dynamic education, 
      dynamic email, 
      dynamic facebook, 
      String? firstName, 
      dynamic gender, 
      dynamic homeAddress, 
      dynamic homeRegion1, 
      dynamic homeRegion1Value, 
      dynamic homeRegion2, 
      dynamic homeRegion2Value, 
      dynamic homeRegion3, 
      dynamic homeRegion3Value, 
      dynamic homeRegion4, 
      dynamic homeRegion4Value, 
      dynamic homeRegionValue, 
      dynamic homeType, 
      String? idType, 
      dynamic imei, 
      String? lastName, 
      dynamic line, 
      dynamic maritalStatus, 
      dynamic middleName, 
      String? mobile, 
      dynamic nameMother, 
      String? noKtp, 
      dynamic numberChildren, 
      dynamic pkgName, 
      String? realName, 
      dynamic religion, 
      String? userId, 
      dynamic uuid,}){
    _apiVersion = apiVersion;
    _appVersion = appVersion;
    _birthday = birthday;
    _duraOccupancy = duraOccupancy;
    _education = education;
    _email = email;
    _facebook = facebook;
    _firstName = firstName;
    _gender = gender;
    _homeAddress = homeAddress;
    _homeRegion1 = homeRegion1;
    _homeRegion1Value = homeRegion1Value;
    _homeRegion2 = homeRegion2;
    _homeRegion2Value = homeRegion2Value;
    _homeRegion3 = homeRegion3;
    _homeRegion3Value = homeRegion3Value;
    _homeRegion4 = homeRegion4;
    _homeRegion4Value = homeRegion4Value;
    _homeRegionValue = homeRegionValue;
    _homeType = homeType;
    _idType = idType;
    _imei = imei;
    _lastName = lastName;
    _line = line;
    _maritalStatus = maritalStatus;
    _middleName = middleName;
    _mobile = mobile;
    _nameMother = nameMother;
    _noKtp = noKtp;
    _numberChildren = numberChildren;
    _pkgName = pkgName;
    _realName = realName;
    _religion = religion;
    _userId = userId;
    _uuid = uuid;
}

  SUserInfoResult.fromJson(dynamic json) {
    _apiVersion = json['api_version'];
    _appVersion = json['app_version'];
    _birthday = json['birthday'];
    _duraOccupancy = json['dura_occupancy'];
    _education = json['education'];
    _email = json['email'];
    _facebook = json['facebook'];
    _firstName = json['first_name'];
    _gender = json['gender'];
    _homeAddress = json['home_address'];
    _homeRegion1 = json['home_region_1'];
    _homeRegion1Value = json['home_region_1_value'];
    _homeRegion2 = json['home_region_2'];
    _homeRegion2Value = json['home_region_2_value'];
    _homeRegion3 = json['home_region_3'];
    _homeRegion3Value = json['home_region_3_value'];
    _homeRegion4 = json['home_region_4'];
    _homeRegion4Value = json['home_region_4_value'];
    _homeRegionValue = json['home_region_value'];
    _homeType = json['home_type'];
    _idType = json['idType'].toString();
    _imei = json['imei'];
    _lastName = json['last_name'];
    _line = json['line'];
    _maritalStatus = json['marital_status'];
    _middleName = json['middle_name'];
    _mobile = json['mobile'];
    _nameMother = json['name_mother'];
    _noKtp = json['no_ktp'];
    _numberChildren = json['number_children'];
    _pkgName = json['pkg_name'];
    _realName = json['real_name'];
    _religion = json['religion'];
    _userId = json['user_id'];
    _uuid = json['uuid'];
  }
  dynamic _apiVersion;
  dynamic _appVersion;
  dynamic _birthday;
  dynamic _duraOccupancy;
  dynamic _education;
  dynamic _email;
  dynamic _facebook;
  String? _firstName;
  dynamic _gender;
  dynamic _homeAddress;
  dynamic _homeRegion1;
  dynamic _homeRegion1Value;
  dynamic _homeRegion2;
  dynamic _homeRegion2Value;
  dynamic _homeRegion3;
  dynamic _homeRegion3Value;
  dynamic _homeRegion4;
  dynamic _homeRegion4Value;
  dynamic _homeRegionValue;
  dynamic _homeType;
  String? _idType;
  dynamic _imei;
  String? _lastName;
  dynamic _line;
  dynamic _maritalStatus;
  dynamic _middleName;
  String? _mobile;
  String? _nameMother="";
  String? _noKtp="";
  dynamic _numberChildren;
  dynamic _pkgName;
  String? _realName;
  dynamic _religion;
  String? _userId;
  dynamic _uuid;

  dynamic get apiVersion => _apiVersion;
  dynamic get appVersion => _appVersion;
  String? get birthday => _birthday;
  String? get duraOccupancy => _duraOccupancy;
  String? get education => _education;
  String? get email => _email;
  String? get facebook => _facebook;
  String? get firstName => _firstName;
  String? get gender => _gender;
  String? get homeAddress => _homeAddress;
  dynamic get homeRegion1 => _homeRegion1;
  String? get homeRegion1Value => _homeRegion1Value;
  dynamic get homeRegion2 => _homeRegion2;
  String? get homeRegion2Value => _homeRegion2Value;
  dynamic get homeRegion3 => _homeRegion3;
  String? get homeRegion3Value => _homeRegion3Value;
  dynamic get homeRegion4 => _homeRegion4;
  dynamic get homeRegion4Value => _homeRegion4Value;
  dynamic get homeRegionValue => _homeRegionValue;
  String? get homeType => _homeType;
  String? get idType => _idType;
  dynamic get imei => _imei;
  String? get lastName => _lastName;
  String? get line => _line;
  String? get maritalStatus => _maritalStatus;
  String? get middleName => _middleName;
  String? get mobile => _mobile;
  String? get nameMother => _nameMother;
  String? get noKtp => _noKtp;
  String? get numberChildren => _numberChildren;
  String? get pkgName => _pkgName;
  String? get realName => _realName;
  String? get religion => _religion;
  String? get userId => _userId;
  String? get uuid => _uuid;


  @override
  String toString() {
    return 'SUserInfoResult{_apiVersion: $_apiVersion, _appVersion: $_appVersion, _birthday: $_birthday, _duraOccupancy: $_duraOccupancy, _education: $_education, _email: $_email, _facebook: $_facebook, _firstName: $_firstName, _gender: $_gender, _homeAddress: $_homeAddress, _homeRegion1: $_homeRegion1, _homeRegion1Value: $_homeRegion1Value, _homeRegion2: $_homeRegion2, _homeRegion2Value: $_homeRegion2Value, _homeRegion3: $_homeRegion3, _homeRegion3Value: $_homeRegion3Value, _homeRegion4: $_homeRegion4, _homeRegion4Value: $_homeRegion4Value, _homeRegionValue: $_homeRegionValue, _homeType: $_homeType, _idType: $_idType, _imei: $_imei, _lastName: $_lastName, _line: $_line, _maritalStatus: $_maritalStatus, _middleName: $_middleName, _mobile: $_mobile, _nameMother: $_nameMother, _noKtp: $_noKtp, _numberChildren: $_numberChildren, _pkgName: $_pkgName, _realName: $_realName, _religion: $_religion, _userId: $_userId, _uuid: $_uuid}';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['api_version'] = _apiVersion;
    map['app_version'] = _appVersion;
    map['birthday'] = _birthday;
    map['dura_occupancy'] = _duraOccupancy;
    map['education'] = _education;
    map['email'] = _email;
    map['facebook'] = _facebook;
    map['first_name'] = _firstName;
    map['gender'] = _gender;
    map['home_address'] = _homeAddress;
    map['home_region_1'] = _homeRegion1;
    map['home_region_1_value'] = _homeRegion1Value;
    map['home_region_2'] = _homeRegion2;
    map['home_region_2_value'] = _homeRegion2Value;
    map['home_region_3'] = _homeRegion3;
    map['home_region_3_value'] = _homeRegion3Value;
    map['home_region_4'] = _homeRegion4;
    map['home_region_4_value'] = _homeRegion4Value;
    map['home_region_value'] = _homeRegionValue;
    map['home_type'] = _homeType;
    map['idType'] = _idType;
    map['imei'] = _imei;
    map['last_name'] = _lastName;
    map['line'] = _line;
    map['marital_status'] = _maritalStatus;
    map['middle_name'] = _middleName;
    map['mobile'] = _mobile;
    map['name_mother'] = _nameMother;
    map['no_ktp'] = _noKtp;
    map['number_children'] = _numberChildren;
    map['pkg_name'] = _pkgName;
    map['real_name'] = _realName;
    map['religion'] = _religion;
    map['user_id'] = _userId;
    map['uuid'] = _uuid;
    return map;
  }

}
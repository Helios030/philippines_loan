/// code : "200"
/// sign : "c6f7ea0f318df976491ed1d02427fb70"
/// result : {"blackErrorMsg":null,"blackUserFlag":null,"certIdentity":null,"custId":"2671","errorCode":null,"errorMessage":null,"firstLoginImg":null,"firstLoginSkip":null,"firstLoginTitle":null,"goolge_url":null,"hasLoanApp":false,"mobile":null,"phone":"017629047839","phonepre":"66","realName":null,"register":false,"signKeyToken":"1FE855888CAF73DED5D4556B74255FC8","userInfoMap":{"loginStaticKey":"1FE855888CAF73DED5D4556B74255FC8","user_id":"2202110181734542402671"},"userName":"nwd7YY","user_id":"2202110181734542402671","vcode":null}
/// message : ""

class SmsReslut {

 String _code="";
 String? _sign="";
 SResult? _result=null;
 String _message="";

  SmsReslut(
      this._code,
      this._sign,
      this. _result,
      this._message);

  SmsReslut.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = (json['result'] != null ? SResult.fromJson(json['result']) : null);
    _message = json['message'];
  }


  String get code => _code;
  String? get sign => _sign;
  SResult? get result => _result;
  String get message => _message;

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

/// blackErrorMsg : null
/// blackUserFlag : null
/// certIdentity : null
/// custId : "2671"
/// errorCode : null
/// errorMessage : null
/// firstLoginImg : null
/// firstLoginSkip : null
/// firstLoginTitle : null
/// goolge_url : null
/// hasLoanApp : false
/// mobile : null
/// phone : "017629047839"
/// phonepre : "66"
/// realName : null
/// register : false
/// signKeyToken : "1FE855888CAF73DED5D4556B74255FC8"
/// userInfoMap : {"loginStaticKey":"1FE855888CAF73DED5D4556B74255FC8","user_id":"2202110181734542402671"}
/// userName : "nwd7YY"
/// user_id : "2202110181734542402671"
/// vcode : null

class SResult {

  dynamic? _blackErrorMsg;
  dynamic? _blackUserFlag;
  dynamic? _certIdentity;
  String? _custId;
  dynamic? _errorCode;
  dynamic? _errorMessage;
  dynamic? _firstLoginImg;
  dynamic? _firstLoginSkip;
  dynamic? _firstLoginTitle;
  dynamic? _goolgeUrl;
  bool? _hasLoanApp;
  dynamic? _mobile;
  String? _phone;
  String? _phonepre;
  dynamic? _realName;
  bool? _register;
  String? _signKeyToken;
  UserInfoMap? _userInfoMap;
  String? _userName;
  String? _userId;
  dynamic? _vcode;

  SResult({
      dynamic? blackErrorMsg,
      dynamic? blackUserFlag,
      dynamic? certIdentity,
      required String? custId,
      dynamic? errorCode,
      dynamic? errorMessage,
      dynamic? firstLoginImg,
      dynamic? firstLoginSkip,
      dynamic? firstLoginTitle,
      dynamic? goolgeUrl,
      required bool hasLoanApp,
      dynamic? mobile,
      required String phone,
      required String phonepre,
      dynamic? realName,
      required bool? register,
      required String? signKeyToken,
      required UserInfoMap? userInfoMap,
      required String? userName,
      required String? userId,
      dynamic? vcode,}){
    _blackErrorMsg = blackErrorMsg;
    _blackUserFlag = blackUserFlag;
    _certIdentity = certIdentity;
    _custId = custId;
    _errorCode = errorCode;
    _errorMessage = errorMessage;
    _firstLoginImg = firstLoginImg;
    _firstLoginSkip = firstLoginSkip;
    _firstLoginTitle = firstLoginTitle;
    _goolgeUrl = goolgeUrl;
    _hasLoanApp = hasLoanApp;
    _mobile = mobile;
    _phone = phone;
    _phonepre = phonepre;
    _realName = realName;
    _register = register;
    _signKeyToken = signKeyToken;
    _userInfoMap = userInfoMap;
    _userName = userName;
    _userId = userId;
    _vcode = vcode;
}

  SResult.fromJson(dynamic json) {
    _blackErrorMsg = json['blackErrorMsg'];
    _blackUserFlag = json['blackUserFlag'];
    _certIdentity = json['certIdentity'];
    _custId = json['custId'];
    _errorCode = json['errorCode'];
    _errorMessage = json['errorMessage'];
    _firstLoginImg = json['firstLoginImg'];
    _firstLoginSkip = json['firstLoginSkip'];
    _firstLoginTitle = json['firstLoginTitle'];
    _goolgeUrl = json['goolge_url'];
    _hasLoanApp = json['hasLoanApp'];
    _mobile = json['mobile'];
    _phone = json['phone'];
    _phonepre = json['phonepre'];
    _realName = json['realName'];
    _register = json['register'];
    _signKeyToken = json['signKeyToken'];
    _userInfoMap = (json['userInfoMap'] != null ? UserInfoMap.fromJson(json['userInfoMap']) : null)!;
    _userName = json['userName'];
    _userId = json['user_id'];
    _vcode = json['vcode'];
  }


  dynamic get blackErrorMsg => _blackErrorMsg;
  dynamic get blackUserFlag => _blackUserFlag;
  dynamic get certIdentity => _certIdentity;
  String? get custId => _custId;
  dynamic get errorCode => _errorCode;
  dynamic get errorMessage => _errorMessage;
  dynamic get firstLoginImg => _firstLoginImg;
  dynamic get firstLoginSkip => _firstLoginSkip;
  dynamic get firstLoginTitle => _firstLoginTitle;
  dynamic get goolgeUrl => _goolgeUrl;
  bool? get hasLoanApp => _hasLoanApp;
  dynamic get mobile => _mobile;
  String? get phone => _phone;
  String? get phonepre => _phonepre;
  dynamic get realName => _realName;
  bool? get register => _register;
  String? get signKeyToken => _signKeyToken;
  UserInfoMap? get userInfoMap => _userInfoMap;
  String? get userName => _userName;
  String? get userId => _userId;
  dynamic get vcode => _vcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['blackErrorMsg'] = _blackErrorMsg;
    map['blackUserFlag'] = _blackUserFlag;
    map['certIdentity'] = _certIdentity;
    map['custId'] = _custId;
    map['errorCode'] = _errorCode;
    map['errorMessage'] = _errorMessage;
    map['firstLoginImg'] = _firstLoginImg;
    map['firstLoginSkip'] = _firstLoginSkip;
    map['firstLoginTitle'] = _firstLoginTitle;
    map['goolge_url'] = _goolgeUrl;
    map['hasLoanApp'] = _hasLoanApp;
    map['mobile'] = _mobile;
    map['phone'] = _phone;
    map['phonepre'] = _phonepre;
    map['realName'] = _realName;
    map['register'] = _register;
    map['signKeyToken'] = _signKeyToken;
    if (_userInfoMap != null) {
      map['userInfoMap'] = _userInfoMap?.toJson();
    }
    map['userName'] = _userName;
    map['user_id'] = _userId;
    map['vcode'] = _vcode;
    return map;
  }

}

/// loginStaticKey : "1FE855888CAF73DED5D4556B74255FC8"
/// user_id : "2202110181734542402671"

class UserInfoMap {
  UserInfoMap({
      required String loginStaticKey,
      required String userId,}){
    _loginStaticKey = loginStaticKey;
    _userId = userId;
}

  UserInfoMap.fromJson(dynamic json) {
    _loginStaticKey = json['loginStaticKey'];
    _userId = json['user_id'];
  }
  String? _loginStaticKey;
  String? _userId;

  String? get loginStaticKey => _loginStaticKey;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['loginStaticKey'] = _loginStaticKey;
    map['user_id'] = _userId;
    return map;
  }

}
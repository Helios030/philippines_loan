

class Photo_reslut {
  Photo_reslut({
      String? code, 
      String? sign, 
      PhotoInfoResult? result,
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}

  Photo_reslut.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = json['result'] != null ? PhotoInfoResult.fromJson(json['result']) : null;
    _message = json['message'];
  }
  String? _code;
  String? _sign;
  PhotoInfoResult? _result;
  String? _message;


  @override
  String toString() {
    return 'Photo_reslut{_code: $_code, _sign: $_sign, _result: $_result, _message: $_message}';
  }

  String? get code => _code;
  String? get sign => _sign;
  PhotoInfoResult? get result => _result;
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

/// ktp : "https: //kxy-test.oss-cn-hongkong.aliyuncs.com/20211111/1636612588_1220211111143628000007216-5.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20211111T072553Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=LTAI4GHjRTr5pqpVaZgDeboi%2F20211111%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=7082f5793b669afe9308ed466432f458363e8304ca29957dd49a751e6df70d68"
/// ktp2 : "null"
/// work : "null"

class PhotoInfoResult {
  PhotoInfoResult({
      String? ktp, 
      String? ktp2, 
      String? work,}){
    _ktp = ktp;
    _ktp2 = ktp2;
    _work = work;
}

  @override
  String toString() {
    return 'PhotoInfoResult{_ktp: $_ktp, _ktp2: $_ktp2, _work: $_work}';
  }

  PhotoInfoResult.fromJson(dynamic json) {
    _ktp = json['ktp'];
    _ktp2 = json['ktp2'];
    _work = json['work'];
  }
  String? _ktp;
  String? _ktp2;
  String? _work;

  String? get ktp => _ktp;
  String? get ktp2 => _ktp2;
  String? get work => _work;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ktp'] = _ktp;
    map['ktp2'] = _ktp2;
    map['work'] = _work;
    return map;
  }

}
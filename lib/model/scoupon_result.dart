/// code : "tQR0)"
/// sign : "6s]wF&"
/// result : {"title":"5YlUe","explain":"lSn)3","startTime":"sUi)","endTime":"S1)","status":-6513610241122240,"couponAmount":"AwDQN"}

class SCouponResult {
  SCouponResult({
      String? code, 
      String? sign, 
      CouponResult? result,}){
    _code = code;
    _sign = sign;
    _result = result;
}

  SCouponResult.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = json['result'] != null ? CouponResult.fromJson(json['result']) : null;
  }
  String? _code;
  String? _sign;
  CouponResult? _result;
  String? get code => _code;
  String? get sign => _sign;
  CouponResult? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['sign'] = _sign;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    return map;
  }

}

/// title : "5YlUe"
/// explain : "lSn)3"
/// startTime : "sUi)"
/// endTime : "S1)"
/// status : -6513610241122240
/// couponAmount : "AwDQN"

class CouponResult {
  CouponResult({
      String? title, 
      String? explain, 
      String? startTime, 
      String? endTime, 
      int? status, 
      String? couponAmount,}){
    _title = title;
    _explain = explain;
    _startTime = startTime;
    _endTime = endTime;
    _status = status;
    _couponAmount = couponAmount;
}

  CouponResult.fromJson(dynamic json) {
    _title = json['title'];
    _explain = json['explain'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];
    _status = json['status'];
    _couponAmount = json['couponAmount'];
  }
  String? _title;
  String? _explain;
  String? _startTime;
  String? _endTime;
  int? _status;
  String? _couponAmount;

  String? get title => _title;
  String? get explain => _explain;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  int? get status => _status;
  String? get couponAmount => _couponAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['explain'] = _explain;
    map['startTime'] = _startTime;
    map['endTime'] = _endTime;
    map['status'] = _status;
    map['couponAmount'] = _couponAmount;
    return map;
  }

}
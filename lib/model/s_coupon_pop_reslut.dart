/// code : "KhxlX"
/// sign : "7QhbWa0"
/// result : {"activationDays":-3406379699482352,"couponAmount":"lg*lbTf","explain":"991m","popupH5Url":"vbvE(W"}

class S_coupon_pop_reslut {
  S_coupon_pop_reslut({
      String? code, 
      String? sign, 
      SCouponPopReslut? result,}){
    _code = code;
    _sign = sign;
    _result = result;
}

  S_coupon_pop_reslut.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = json['result'] != null ? SCouponPopReslut.fromJson(json['result']) : null;
  }
  String? _code;
  String? _sign;
  SCouponPopReslut? _result;

  String? get code => _code;
  String? get sign => _sign;
  SCouponPopReslut? get result => _result;

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

/// activationDays : -3406379699482352
/// couponAmount : "lg*lbTf"
/// explain : "991m"
/// popupH5Url : "vbvE(W"

class SCouponPopReslut {
  SCouponPopReslut({
      int? activationDays, 
      String? couponAmount, 
      String? explain, 
      String? popupH5Url,}){
    _activationDays = activationDays;
    _couponAmount = couponAmount;
    _explain = explain;
    _popupH5Url = popupH5Url;
}

  SCouponPopReslut.fromJson(dynamic json) {
    _activationDays = json['activationDays'];
    _couponAmount = json['couponAmount'];
    _explain = json['explain'];
    _popupH5Url = json['popupH5Url'];
  }
  int? _activationDays;
  String? _couponAmount;
  String? _explain;
  String? _popupH5Url;

  int? get activationDays => _activationDays;
  String? get couponAmount => _couponAmount;
  String? get explain => _explain;
  String? get popupH5Url => _popupH5Url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activationDays'] = _activationDays;
    map['couponAmount'] = _couponAmount;
    map['explain'] = _explain;
    map['popupH5Url'] = _popupH5Url;
    return map;
  }

}
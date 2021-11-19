/// code : "200"
/// sign : "61b599fd996eba0be8a581a1be087af0"
/// result : [{"amount2Account":"1,000","duration":7,"enable":"1","fee":"1,000","interest":"7","maxOverdueNum":8,"minOverdueNum":0,"paymentAmount":"2,007","principal":"2,000","productId":20,"repayNum":0},{"amount2Account":"2,357","duration":7,"enable":"1","fee":"143","interest":"8","maxOverdueNum":7,"minOverdueNum":0,"paymentAmount":"2,509","principal":"2,500","productId":21,"repayNum":1},{"amount2Account":"2,275","duration":7,"enable":"2","fee":"1,225","interest":"12","maxOverdueNum":6,"minOverdueNum":0,"paymentAmount":"3,512","principal":"3,500","productId":22,"repayNum":2},{"amount2Account":"3,575","duration":7,"enable":"2","fee":"1,925","interest":"19","maxOverdueNum":5,"minOverdueNum":0,"paymentAmount":"5,519","principal":"5,500","productId":23,"repayNum":3},{"amount2Account":"4,225","duration":7,"enable":"2","fee":"2,275","interest":"22","maxOverdueNum":4,"minOverdueNum":0,"paymentAmount":"6,523","principal":"6,500","productId":24,"repayNum":4},{"amount2Account":"4,550","duration":7,"enable":"2","fee":"2,450","interest":"24","maxOverdueNum":3,"minOverdueNum":0,"paymentAmount":"7,024","principal":"7,000","productId":25,"repayNum":5},{"amount2Account":"4,875","duration":7,"enable":"2","fee":"2,625","interest":"26","maxOverdueNum":2,"minOverdueNum":0,"paymentAmount":"7,526","principal":"7,500","productId":26,"repayNum":6},{"amount2Account":"5,200","duration":7,"enable":"2","fee":"2,800","interest":"28","maxOverdueNum":1,"minOverdueNum":0,"paymentAmount":"8,028","principal":"8,000","productId":27,"repayNum":7},{"amount2Account":"9,500","duration":14,"enable":"2","fee":"500","interest":"70","maxOverdueNum":0,"minOverdueNum":0,"paymentAmount":"10,070","principal":"10,000","productId":31,"repayNum":8}]
/// message : ""

class Products {
  Products({
      String? code, 
      String? sign, 
      List<PResult>? result,
      String? message,}){
    _code = code;
    _sign = sign;
    Nresult = result;
    _message = message;
}


  @override
  String toString() {
    return 'Products{_code: $_code, _sign: $_sign, _result: $Nresult, _message: $_message}';
  }

  Products.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    if (json['result'] != null) {
      Nresult = [];
      json['result'].forEach((v) {
        Nresult?.add(PResult.fromJson(v));
      });
    }
    _message = json['message'];
  }
  String? _code;
  String? _sign;
  List<PResult>? Nresult;
  String? _message;



  String? get code => _code;
  String? get sign => _sign;
  List<PResult>? get result => Nresult;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['sign'] = _sign;
    if (Nresult != null) {
      map['result'] = Nresult?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// amount2Account : "1,000"
/// duration : 7
/// enable : "1"
/// fee : "1,000"
/// interest : "7"
/// maxOverdueNum : 8
/// minOverdueNum : 0
/// paymentAmount : "2,007"
/// principal : "2,000"
/// productId : 20
/// repayNum : 0

class PResult {

  PResult({
      String? amount2Account, 
      int? duration, 
      String? enable, 
      String? fee, 
      String? interest, 
      int? maxOverdueNum, 
      int? minOverdueNum, 
      String? paymentAmount, 
      String? principal, 
      int? productId, 
      int? repayNum,}){
    _amount2Account = amount2Account;
    _duration = duration;
    _enable = enable;
    _fee = fee;
    _interest = interest;
    _maxOverdueNum = maxOverdueNum;
    _minOverdueNum = minOverdueNum;
    _paymentAmount = paymentAmount;
    _principal = principal;
    _productId = productId;
    _repayNum = repayNum;
}

  PResult.fromJson(dynamic json) {
    _amount2Account = json['amount2Account'];
    _duration = json['duration'];
    _enable = json['enable'];
    _fee = json['fee'];
    _interest = json['interest'];
    _maxOverdueNum = json['maxOverdueNum'];
    _minOverdueNum = json['minOverdueNum'];
    _paymentAmount = json['paymentAmount'];
    _principal = json['principal'];
    _productId = json['productId'];
    _repayNum = json['repayNum'];
  }
  String? _amount2Account;
  int? _duration;
  String? _enable;
  String? _fee;
  String? _interest;
  int? _maxOverdueNum;
  int? _minOverdueNum;
  String? _paymentAmount;
  String? _principal;
  int? _productId;
  int? _repayNum;

  String? get amount2Account => _amount2Account;
  int? get duration => _duration;
  String? get enable => _enable;
  String? get fee => _fee;
  String? get interest => _interest;
  int? get maxOverdueNum => _maxOverdueNum;
  int? get minOverdueNum => _minOverdueNum;
  String? get paymentAmount => _paymentAmount;
  String? get principal => _principal;
  int? get productId => _productId;
  int? get repayNum => _repayNum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount2Account'] = _amount2Account;
    map['duration'] = _duration;
    map['enable'] = _enable;
    map['fee'] = _fee;
    map['interest'] = _interest;
    map['maxOverdueNum'] = _maxOverdueNum;
    map['minOverdueNum'] = _minOverdueNum;
    map['paymentAmount'] = _paymentAmount;
    map['principal'] = _principal;
    map['productId'] = _productId;
    map['repayNum'] = _repayNum;
    return map;
  }

  @override
  String toString() {
    return 'Result{_amount2Account: $_amount2Account, _duration: $_duration, _enable: $_enable, _fee: $_fee, _interest: $_interest, _maxOverdueNum: $_maxOverdueNum, _minOverdueNum: $_minOverdueNum, _paymentAmount: $_paymentAmount, _principal: $_principal, _productId: $_productId, _repayNum: $_repayNum}';
  }
}
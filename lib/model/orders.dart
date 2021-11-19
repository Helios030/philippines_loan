/// code : "200"
/// sign : "72631be85174f3be7c7ec5ce2ecc25a8"
/// result : [{"amount2Account":"3,575","app_time":"2021-10-29","application_id":"1020211029175814000002193","apply_time":1635497894000,"approval_time":"","bank_code":"22","bid_status":2,"borrow_time":"2021-10-29","borrow_time_kim":"2021-10-29 16:59:20","card_holder":"น.ส. น้ำอ้อย แตงกระโทก","card_no":"336******693","deposit_time":"2021-11-05","duration":"7","fale_fee":"0","fee":"1,925","has_loan_app":true,"interest":"19","interestRate":0.05,"loan_status":5,"no_ktp":"316*******981","pay":"0","paymentAmount":"5,519","penalty":"0","penalty_days":5,"principal":"5,500","reApplyFace":false,"reach_amount":"0","remainAmount":"5,500","repayment_day":"5","risk":"0","rollover_fee":"1,925","secAppTime":null,"service":"1,925"},{"amount2Account":"2,275","app_time":"2021-10-29","application_id":"1020211029175511000002192","apply_time":1635497711000,"approval_time":"","bank_code":"22","bid_status":3,"borrow_time":"2021-10-29","borrow_time_kim":"2021-10-29 16:56:01","card_holder":"น.ส. น้ำอ้อย แตงกระโทก","card_no":"336******693","deposit_time":"2021-11-05","duration":"7","fale_fee":"0","fee":"1,225","has_loan_app":true,"interest":"12","interestRate":0.05,"loan_status":6,"no_ktp":"316*******981","pay":"0","pay_time":"2021-10-29","paymentAmount":"3,512","penalty":"0","penalty_days":0,"principal":"3,500","reApplyFace":false,"reach_amount":"3,500","reach_time":1635436800000,"real_reach_time":"2021-10-29 00:00:00","remainAmount":"00","repaymentAmount":"3,500","repayment_day":"5","risk":"0","rollover_fee":"1,225","secAppTime":null,"service":"1,225"},{"amount2Account":"2,357","app_time":"2021-10-29","application_id":"1020211029175216000002191","apply_time":1635497536000,"approval_time":"","bank_code":"22","bid_status":3,"borrow_time":"2021-10-29","borrow_time_kim":"2021-10-29 16:53:05","card_holder":"น.ส. น้ำอ้อย แตงกระโทก","card_no":"336******693","deposit_time":"2021-11-05","duration":"7","fale_fee":"0","fee":"143","has_loan_app":true,"interest":"9","interestRate":0.05,"loan_status":6,"no_ktp":"316*******981","pay":"51","pay_time":"2021-10-29","paymentAmount":"2,509","penalty":"0","penalty_days":0,"principal":"2,500","reApplyFace":false,"reach_amount":"2,500","reach_time":1635436800000,"real_reach_time":"2021-10-29 00:00:00","remainAmount":"00","repaymentAmount":"2,500","repayment_day":"5","risk":"69","rollover_fee":"143","secAppTime":null,"service":"23"},{"amount2Account":"1,000","app_time":"2021-10-29","application_id":"1020211029174752000002190","apply_time":1635497272000,"approval_time":"","bank_code":"22","bid_status":3,"borrow_time":"2021-10-29","borrow_time_kim":"2021-10-29 16:50:09","card_holder":"น.ส. น้ำอ้อย แตงกระโทก","card_no":"336******693","deposit_time":"2021-11-05","duration":"7","fale_fee":"0","fee":"1,000","has_loan_app":true,"interest":"7","interestRate":0.05,"loan_status":6,"no_ktp":"316*******981","pay":"500","pay_time":"2021-10-29","paymentAmount":"2,007","penalty":"0","penalty_days":0,"principal":"2,000","reApplyFace":false,"reach_amount":"2,000","reach_time":1635436800000,"real_reach_time":"2021-10-29 00:00:00","remainAmount":"00","repaymentAmount":"2,000","repayment_day":"5","risk":"200","rollover_fee":"1,000","secAppTime":null,"service":"300"}]
/// message : ""

class Orders {
  Orders({
      String? code, 
      String? sign, 
      List<OrdersResult>? result,
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}


  @override
  String toString() {
    return 'Orders{_code: $_code, _sign: $_sign, _result: $_result, _message: $_message}';
  }

  Orders.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(OrdersResult.fromJson(v));
      });
    }
    _message = json['message'];
  }
  String? _code;
  String? _sign;
  List<OrdersResult>? _result;
  String? _message;

  String? get code => _code;
  String? get sign => _sign;
  List<OrdersResult>? get result => _result;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['sign'] = _sign;
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// amount2Account : "3,575"
/// app_time : "2021-10-29"
/// application_id : "1020211029175814000002193"
/// apply_time : 1635497894000
/// approval_time : ""
/// bank_code : "22"
/// bid_status : 2
/// borrow_time : "2021-10-29"
/// borrow_time_kim : "2021-10-29 16:59:20"
/// card_holder : "น.ส. น้ำอ้อย แตงกระโทก"
/// card_no : "336******693"
/// deposit_time : "2021-11-05"
/// duration : "7"
/// fale_fee : "0"
/// fee : "1,925"
/// has_loan_app : true
/// interest : "19"
/// interestRate : 0.05
/// loan_status : 5
/// no_ktp : "316*******981"
/// pay : "0"
/// paymentAmount : "5,519"
/// penalty : "0"
/// penalty_days : 5
/// principal : "5,500"
/// reApplyFace : false
/// reach_amount : "0"
/// remainAmount : "5,500"
/// repayment_day : "5"
/// risk : "0"
/// rollover_fee : "1,925"
/// secAppTime : null
/// service : "1,925"

class OrdersResult {
  OrdersResult({
      String? amount2Account, 
      String? appTime, 
      String? applicationId, 
      int? applyTime, 
      String? approvalTime, 
      String? bankCode, 
      int? bidStatus, 
      String? borrowTime, 
      String? borrowTimeKim, 
      String? cardHolder, 
      String? cardNo, 
      String? depositTime, 
      String? duration, 
      String? faleFee, 
      String? fee, 
      bool? hasLoanApp, 
      String? interest, 
      double? interestRate, 
      int? loanStatus, 
      String? noKtp, 
      String? pay, 
      String? paymentAmount, 
      String? penalty, 
      int? penaltyDays, 
      String? principal, 
      bool? reApplyFace, 
      String? reachAmount, 
      String? remainAmount, 
      String? repaymentDay, 
      String? risk, 
      String? rolloverFee, 
      dynamic secAppTime, 
      String? service,}){
    _amount2Account = amount2Account;
    _appTime = appTime;
    _applicationId = applicationId;
    _applyTime = applyTime;
    _approvalTime = approvalTime;
    _bankCode = bankCode;
    _bidStatus = bidStatus;
    _borrowTime = borrowTime;
    _borrowTimeKim = borrowTimeKim;
    _cardHolder = cardHolder;
    _cardNo = cardNo;
    _depositTime = depositTime;
    _duration = duration;
    _faleFee = faleFee;
    _fee = fee;
    _hasLoanApp = hasLoanApp;
    _interest = interest;
    _interestRate = interestRate;
    _loanStatus = loanStatus;
    _noKtp = noKtp;
    _pay = pay;
    _paymentAmount = paymentAmount;
    _penalty = penalty;
    _penaltyDays = penaltyDays;
    _principal = principal;
    _reApplyFace = reApplyFace;
    _reachAmount = reachAmount;
    _remainAmount = remainAmount;
    _repaymentDay = repaymentDay;
    _risk = risk;
    _rolloverFee = rolloverFee;
    _secAppTime = secAppTime;
    _service = service;
}

  OrdersResult.fromJson(dynamic json) {
    _amount2Account = json['amount2Account'];
    _appTime = json['app_time'];
    _applicationId = json['application_id'];
    _applyTime = json['apply_time'];
    _approvalTime = json['approval_time'];
    _bankCode = json['bank_code'];
    _bidStatus = json['bid_status'];
    _borrowTime = json['borrow_time'];
    _borrowTimeKim = json['borrow_time_kim'];
    _cardHolder = json['card_holder'];
    _cardNo = json['card_no'];
    _depositTime = json['deposit_time'];
    _duration = json['duration'];
    _faleFee = json['fale_fee'];
    _fee = json['fee'];
    _hasLoanApp = json['has_loan_app'];
    _interest = json['interest'];
    _interestRate = json['interestRate'];
    _loanStatus = json['loan_status'];
    _noKtp = json['no_ktp'];
    _pay = json['pay'];
    _paymentAmount = json['paymentAmount'];
    _penalty = json['penalty'];
    _penaltyDays = json['penalty_days'];
    _principal = json['principal'];
    _reApplyFace = json['reApplyFace'];
    _reachAmount = json['reach_amount'];
    _remainAmount = json['remainAmount'];
    _repaymentDay = json['repayment_day'];
    _risk = json['risk'];
    _rolloverFee = json['rollover_fee'];
    _secAppTime = json['secAppTime'];
    _service = json['service'];
  }


  @override
  String toString() {
    return 'OrdersResult{_amount2Account: $_amount2Account, _appTime: $_appTime, _applicationId: $_applicationId, _applyTime: $_applyTime, _approvalTime: $_approvalTime, _bankCode: $_bankCode, _bidStatus: $_bidStatus, _borrowTime: $_borrowTime, _borrowTimeKim: $_borrowTimeKim, _cardHolder: $_cardHolder, _cardNo: $_cardNo, _depositTime: $_depositTime, _duration: $_duration, _faleFee: $_faleFee, _fee: $_fee, _hasLoanApp: $_hasLoanApp, _interest: $_interest, _interestRate: $_interestRate, _loanStatus: $_loanStatus, _noKtp: $_noKtp, _pay: $_pay, _paymentAmount: $_paymentAmount, _penalty: $_penalty, _penaltyDays: $_penaltyDays, _principal: $_principal, _reApplyFace: $_reApplyFace, _reachAmount: $_reachAmount, _remainAmount: $_remainAmount, _repaymentDay: $_repaymentDay, _risk: $_risk, _rolloverFee: $_rolloverFee, _secAppTime: $_secAppTime, _service: $_service}';
  }

  String? _amount2Account;
  String? _appTime;
  String? _applicationId;
  int? _applyTime;
  String? _approvalTime;
  String? _bankCode;
  int? _bidStatus;
  String? _borrowTime;
  String? _borrowTimeKim;
  String? _cardHolder;
  String? _cardNo;
  String? _depositTime;
  String? _duration;
  String? _faleFee;
  String? _fee;
  bool? _hasLoanApp;
  String? _interest;
  double? _interestRate;
  int? _loanStatus;
  String? _noKtp;
  String? _pay;
  String? _paymentAmount;
  String? _penalty;
  int? _penaltyDays;
  String? _principal;
  bool? _reApplyFace;
  String? _reachAmount;
  String? _remainAmount;
  String? _repaymentDay;
  String? _risk;
  String? _rolloverFee;
  dynamic _secAppTime;
  String? _service;

  String? get amount2Account => _amount2Account;
  String? get appTime => _appTime;
  String? get applicationId => _applicationId;
  int? get applyTime => _applyTime;
  String? get approvalTime => _approvalTime;
  String? get bankCode => _bankCode;
  int? get bidStatus => _bidStatus;
  String? get borrowTime => _borrowTime;
  String? get borrowTimeKim => _borrowTimeKim;
  String? get cardHolder => _cardHolder;
  String? get cardNo => _cardNo;
  String? get depositTime => _depositTime;
  String? get duration => _duration;
  String? get faleFee => _faleFee;
  String? get fee => _fee;
  bool? get hasLoanApp => _hasLoanApp;
  String? get interest => _interest;
  double? get interestRate => _interestRate;
  int? get loanStatus => _loanStatus;
  String? get noKtp => _noKtp;
  String? get pay => _pay;
  String? get paymentAmount => _paymentAmount;
  String? get penalty => _penalty;
  int? get penaltyDays => _penaltyDays;
  String? get principal => _principal;
  bool? get reApplyFace => _reApplyFace;
  String? get reachAmount => _reachAmount;
  String? get remainAmount => _remainAmount;
  String? get repaymentDay => _repaymentDay;
  String? get risk => _risk;
  String? get rolloverFee => _rolloverFee;
  dynamic get secAppTime => _secAppTime;
  String? get service => _service;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount2Account'] = _amount2Account;
    map['app_time'] = _appTime;
    map['application_id'] = _applicationId;
    map['apply_time'] = _applyTime;
    map['approval_time'] = _approvalTime;
    map['bank_code'] = _bankCode;
    map['bid_status'] = _bidStatus;
    map['borrow_time'] = _borrowTime;
    map['borrow_time_kim'] = _borrowTimeKim;
    map['card_holder'] = _cardHolder;
    map['card_no'] = _cardNo;
    map['deposit_time'] = _depositTime;
    map['duration'] = _duration;
    map['fale_fee'] = _faleFee;
    map['fee'] = _fee;
    map['has_loan_app'] = _hasLoanApp;
    map['interest'] = _interest;
    map['interestRate'] = _interestRate;
    map['loan_status'] = _loanStatus;
    map['no_ktp'] = _noKtp;
    map['pay'] = _pay;
    map['paymentAmount'] = _paymentAmount;
    map['penalty'] = _penalty;
    map['penalty_days'] = _penaltyDays;
    map['principal'] = _principal;
    map['reApplyFace'] = _reApplyFace;
    map['reach_amount'] = _reachAmount;
    map['remainAmount'] = _remainAmount;
    map['repayment_day'] = _repaymentDay;
    map['risk'] = _risk;
    map['rollover_fee'] = _rolloverFee;
    map['secAppTime'] = _secAppTime;
    map['service'] = _service;
    return map;
  }

}
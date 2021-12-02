/// code : "200"
/// sign : "a421a9b3704d276dd53d93d77bc0d9f1"
/// result : {"amount2Account":"1,800","app_time":"2021-10-11","application_id":"1020211011102910000000039","apply_time":1633915750000,"approval_time":"2021-10-12","arrival_status":2,"bank_code":"5","bid_status":2,"borrow_time":"2021-10-12","borrow_time_kim":"2021-10-12 13:16:14","card_holder":"nwdH","card_no":"576******464","data_status":4,"deposit_time":"2021-10-18","duration":"6","fale_fee":"0","fee":"1,200","has_loan_app":true,"interest":"0","interestRate":0.05,"loan_status":"4","no_ktp":"346*******464","pay":"150","paymentAmount":"3,009","penalty":"0","penalty_days":0,"principal":"3,000","reApplyFace":false,"reach_amount":"0","remainAmount":"3,000","repayment_day":"0","risk":"750","rollover_fee":"1,200","secAppTime":1633997335000,"service":"300","withdrawal_channel":"BANK","withdrawal_code":"SKBH10301043"}
/// message : ""

class Loanstatus {
  Loanstatus({
      String? code, 
      String? sign, 
      LoanstatusResult? result,
      String? message,}){
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
}

  Loanstatus.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = json['result'] != null ? LoanstatusResult.fromJson(json['result']) : null;
    _message = json['message'];
  }
  String? _code;
  String? _sign;
  LoanstatusResult? _result;
  String? _message;

  String? get code => _code;
  String? get sign => _sign;
  LoanstatusResult? get result => _result;
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

/// amount2Account : "1,800"
/// app_time : "2021-10-11"
/// application_id : "1020211011102910000000039"
/// apply_time : 1633915750000
/// approval_time : "2021-10-12"
/// arrival_status : 2
/// bank_code : "5"
/// bid_status : 2
/// borrow_time : "2021-10-12"
/// borrow_time_kim : "2021-10-12 13:16:14"
/// card_holder : "nwdH"
/// card_no : "576******464"
/// data_status : 4
/// deposit_time : "2021-10-18"
/// duration : "6"
/// fale_fee : "0"
/// fee : "1,200"
/// has_loan_app : true
/// interest : "0"
/// interestRate : 0.05
/// loan_status : "4"
/// no_ktp : "346*******464"
/// pay : "150"
/// paymentAmount : "3,009"
/// penalty : "0"
/// penalty_days : 0
/// principal : "3,000"
/// reApplyFace : false
/// reach_amount : "0"
/// remainAmount : "3,000"
/// repayment_day : "0"
/// risk : "750"
/// rollover_fee : "1,200"
/// secAppTime : 1633997335000
/// service : "300"
/// withdrawal_channel : "BANK"
/// withdrawal_code : "SKBH10301043"

class LoanstatusResult {
  LoanstatusResult({
      String? amount2Account, 
      String? appTime, 
      String? applicationId, 
      int? applyTime, 
      String? approvalTime, 
      int? arrivalStatus, 
      String? bankCode, 
      int? bidStatus, 
      String? borrowTime, 
      String? borrowTimeKim, 
      String? cardHolder, 
      String? cardNo, 
      int? dataStatus, 
      String? depositTime, 
      String? duration, 
      String? faleFee, 
      String? fee, 
      bool? hasLoanApp, 
      String? interest, 
      double? interestRate, 
      String? loanStatus, 
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
      int? secAppTime, 
      String? service, 
      String? withdrawalChannel, 
      String? withdrawalCode,}){
    _amount2Account = amount2Account;
    _appTime = appTime;
    _applicationId = applicationId;
    _applyTime = applyTime;
    _approvalTime = approvalTime;
    _arrivalStatus = arrivalStatus;
    _bankCode = bankCode;
    _bidStatus = bidStatus;
    _borrowTime = borrowTime;
    _borrowTimeKim = borrowTimeKim;
    _cardHolder = cardHolder;
    _cardNo = cardNo;
    _dataStatus = dataStatus;
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
    _withdrawalChannel = withdrawalChannel;
    _withdrawalCode = withdrawalCode;
}

  LoanstatusResult.fromJson(dynamic json) {
    _amount2Account = json['amount2Account'];
    _appTime = json['app_time'];
    _applicationId = json['application_id'];
    _applyTime = json['apply_time'];
    _approvalTime = json['approval_time'];
    _arrivalStatus = json['arrival_status'];
    _bankCode = json['bank_code'];
    _bidStatus = json['bid_status'];
    _borrowTime = json['borrow_time'];
    _borrowTimeKim = json['borrow_time_kim'];
    _cardHolder = json['card_holder'];
    _cardNo = json['card_no'];
    _dataStatus = json['data_status'];
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
    _withdrawalChannel = json['withdrawal_channel'];
    _withdrawalCode = json['withdrawal_code'];
  }
  String? _amount2Account;
  String? _appTime;
  String? _applicationId;
  int? _applyTime;
  String? _approvalTime;
  int? _arrivalStatus;
  String? _bankCode;
  int? _bidStatus;
  String? _borrowTime;
  String? _borrowTimeKim;
  String? _cardHolder;
  String? _cardNo;
  int? _dataStatus;
  String? _depositTime;
  String? _duration;
  String? _faleFee;
  String? _fee;
  bool? _hasLoanApp;
  String? _interest;
  double? _interestRate;
  String? _loanStatus;
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
  int? _secAppTime;
  String? _service;
  String? _withdrawalChannel;
  String? _withdrawalCode;

  String? get amount2Account => _amount2Account;
  String? get appTime => _appTime;
  String? get applicationId => _applicationId;
  int? get applyTime => _applyTime;
  String? get approvalTime => _approvalTime;
  int? get arrivalStatus => _arrivalStatus;
  String? get bankCode => _bankCode;
  int? get bidStatus => _bidStatus;
  String? get borrowTime => _borrowTime;
  String? get borrowTimeKim => _borrowTimeKim;
  String? get cardHolder => _cardHolder;
  String? get cardNo => _cardNo;
  int? get dataStatus => _dataStatus;
  String? get depositTime => _depositTime;
  String? get duration => _duration;
  String? get faleFee => _faleFee;
  String? get fee => _fee;
  bool? get hasLoanApp => _hasLoanApp;
  String? get interest => _interest;
  double? get interestRate => _interestRate;
  String? get loanStatus => _loanStatus;
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
  int? get secAppTime => _secAppTime;
  String? get service => _service;
  String? get withdrawalChannel => _withdrawalChannel;
  String? get withdrawalCode => _withdrawalCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount2Account'] = _amount2Account;
    map['app_time'] = _appTime;
    map['application_id'] = _applicationId;
    map['apply_time'] = _applyTime;
    map['approval_time'] = _approvalTime;
    map['arrival_status'] = _arrivalStatus;
    map['bank_code'] = _bankCode;
    map['bid_status'] = _bidStatus;
    map['borrow_time'] = _borrowTime;
    map['borrow_time_kim'] = _borrowTimeKim;
    map['card_holder'] = _cardHolder;
    map['card_no'] = _cardNo;
    map['data_status'] = _dataStatus;
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
    map['withdrawal_channel'] = _withdrawalChannel;
    map['withdrawal_code'] = _withdrawalCode;
    return map;
  }

}
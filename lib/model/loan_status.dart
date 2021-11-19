/// code : "200"
/// sign : "49d18f5638a7b1ea0a04f2acf997317b"
/// result : {"amount2Account":"1,000","app_time":"2021-08-27","application_id":"1020210827163733000001483","apply_time":1630049853000,"approval_time":"2021-08-27","bank_code":"13","bid_status":3,"borrow_time":"2021-08-27","borrow_time_kim":"2021-08-27 16:37:47","card_holder":"นาย เอนก ลันระนา","card_no":"958******785","data_status":1,"deposit_time":"2021-09-03","duration":"7","fale_fee":"0","fee":"1,000","has_loan_app":true,"interest":"0","interestRate":0.05,"loan_status":"1","no_ktp":"142*******123","pay":"500","pay_time":"2021-09-29","paymentAmount":"2,007","penalty":"0","penalty_days":3,"principal":"2,000","reApplyFace":false,"reach_amount":"5,800","reach_time":1632844800000,"real_reach_time":"2021-09-29 00:00:00","remainAmount":"00","repaymentAmount":"2,800","repayment_day":"0","risk":"200","rollover_fee":"1,000","secAppTime":1630053404000,"service":"300"}
/// message : ""

class Loanstatus {
  Loanstatus({
    String? code,
    String? sign,
    LoanstatusResult? result,
    String? message,
  }) {
    _code = code;
    _sign = sign;
    _result = result;
    _message = message;
  }

  Loanstatus.fromJson(dynamic json) {
    _code = json['code'];
    _sign = json['sign'];
    _result = json['result'] != null
        ? LoanstatusResult.fromJson(json['result'])
        : null;
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

/// amount2Account : "1,000"
/// app_time : "2021-08-27"
/// application_id : "1020210827163733000001483"
/// apply_time : 1630049853000
/// approval_time : "2021-08-27"
/// bank_code : "13"
/// bid_status : 3
/// borrow_time : "2021-08-27"
/// borrow_time_kim : "2021-08-27 16:37:47"
/// card_holder : "นาย เอนก ลันระนา"
/// card_no : "958******785"
/// data_status : 1
/// deposit_time : "2021-09-03"
/// duration : "7"
/// fale_fee : "0"
/// fee : "1,000"
/// has_loan_app : true
/// interest : "0"
/// interestRate : 0.05
/// loan_status : "1"
/// no_ktp : "142*******123"
/// pay : "500"
/// pay_time : "2021-09-29"
/// paymentAmount : "2,007"
/// penalty : "0"
/// penalty_days : 3
/// principal : "2,000"
/// reApplyFace : false
/// reach_amount : "5,800"
/// reach_time : 1632844800000
/// real_reach_time : "2021-09-29 00:00:00"
/// remainAmount : "00"
/// repaymentAmount : "2,800"
/// repayment_day : "0"
/// risk : "200"
/// rollover_fee : "1,000"
/// secAppTime : 1630053404000
/// service : "300"

class LoanstatusResult {
  LoanstatusResult({
    String? amount2Account,
    String? appTime,
    String? applicationId,
    String? applyTime,
    String? approvalTime,
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
    String? payTime,
    String? paymentAmount,
    String? penalty,
    int? penaltyDays,
    String? principal,
    bool? reApplyFace,
    String? reachAmount,
    int? reachTime,
    String? realReachTime,
    String? remainAmount,
    String? repaymentAmount,
    String? repaymentDay,
    String? risk,
    String? rolloverFee,
    int? secAppTime,
    String? service,
  }) {
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
    _payTime = payTime;
    _paymentAmount = paymentAmount;
    _penalty = penalty;
    _penaltyDays = penaltyDays;
    _principal = principal;
    _reApplyFace = reApplyFace;
    _reachAmount = reachAmount;
    _reachTime = reachTime;
    _realReachTime = realReachTime;
    _remainAmount = remainAmount;
    _repaymentAmount = repaymentAmount;
    _repaymentDay = repaymentDay;
    _risk = risk;
    _rolloverFee = rolloverFee;
    _secAppTime = secAppTime;
    _service = service;
  }

  LoanstatusResult.fromJson(dynamic json) {
    _amount2Account = json['amount2Account'];
    _appTime = json['app_time'];
    _applicationId = json['application_id'];

    var jsonTime = json['apply_time'];

    if (jsonTime.toString().contains("-")) {
      _applyTime = jsonTime;
    } else {
      try {
        _applyTime = DateTime.fromMillisecondsSinceEpoch(jsonTime!)
            .toString()
            .split(" ")[0];
      } catch (exception) {
        print(exception);
        _applyTime = jsonTime;
      }
    }

    _approvalTime = json['approval_time'];
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
    _payTime = json['pay_time'];
    _paymentAmount = json['paymentAmount'];
    _penalty = json['penalty'];
    _penaltyDays = json['penalty_days'];
    _principal = json['principal'];
    _reApplyFace = json['reApplyFace'];
    _reachAmount = json['reach_amount'];
    _reachTime = json['reach_time'];
    _realReachTime = json['real_reach_time'];
    _remainAmount = json['remainAmount'];
    _repaymentAmount = json['repaymentAmount'];
    _repaymentDay = json['repayment_day'];
    _risk = json['risk'];
    _rolloverFee = json['rollover_fee'];
    _secAppTime = json['secAppTime'];
    _service = json['service'];
  }

  String? _amount2Account;
  String? _appTime;
  String? _applicationId;
  String? _applyTime;
  String? _approvalTime;
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
  String? _payTime;
  String? _paymentAmount;
  String? _penalty;
  int? _penaltyDays;
  String? _principal;
  bool? _reApplyFace;
  String? _reachAmount;
  int? _reachTime;
  String? _realReachTime;
  String? _remainAmount;
  String? _repaymentAmount;
  String? _repaymentDay;
  String? _risk;
  String? _rolloverFee;
  int? _secAppTime;
  String? _service;

  String? get amount2Account => _amount2Account;

  String? get appTime => _appTime;

  String? get applicationId => _applicationId;

  String? get applyTime => _applyTime;

  String? get approvalTime => _approvalTime;

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

  String? get payTime => _payTime;

  String? get paymentAmount => _paymentAmount;

  String? get penalty => _penalty;

  int? get penaltyDays => _penaltyDays;

  String? get principal => _principal;

  bool? get reApplyFace => _reApplyFace;

  String? get reachAmount => _reachAmount;

  int? get reachTime => _reachTime;

  String? get realReachTime => _realReachTime;

  String? get remainAmount => _remainAmount;

  String? get repaymentAmount => _repaymentAmount;

  String? get repaymentDay => _repaymentDay;

  String? get risk => _risk;

  String? get rolloverFee => _rolloverFee;

  int? get secAppTime => _secAppTime;

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
    map['pay_time'] = _payTime;
    map['paymentAmount'] = _paymentAmount;
    map['penalty'] = _penalty;
    map['penalty_days'] = _penaltyDays;
    map['principal'] = _principal;
    map['reApplyFace'] = _reApplyFace;
    map['reach_amount'] = _reachAmount;
    map['reach_time'] = _reachTime;
    map['real_reach_time'] = _realReachTime;
    map['remainAmount'] = _remainAmount;
    map['repaymentAmount'] = _repaymentAmount;
    map['repayment_day'] = _repaymentDay;
    map['risk'] = _risk;
    map['rollover_fee'] = _rolloverFee;
    map['secAppTime'] = _secAppTime;
    map['service'] = _service;
    return map;
  }

  @override
  String toString() {
    return 'LoanstatusResult{_amount2Account: $_amount2Account, _appTime: $_appTime, _applicationId: $_applicationId, _applyTime: $_applyTime, _approvalTime: $_approvalTime, _bankCode: $_bankCode, _bidStatus: $_bidStatus, _borrowTime: $_borrowTime, _borrowTimeKim: $_borrowTimeKim, _cardHolder: $_cardHolder, _cardNo: $_cardNo, _dataStatus: $_dataStatus, _depositTime: $_depositTime, _duration: $_duration, _faleFee: $_faleFee, _fee: $_fee, _hasLoanApp: $_hasLoanApp, _interest: $_interest, _interestRate: $_interestRate, _loanStatus: $_loanStatus, _noKtp: $_noKtp, _pay: $_pay, _payTime: $_payTime, _paymentAmount: $_paymentAmount, _penalty: $_penalty, _penaltyDays: $_penaltyDays, _principal: $_principal, _reApplyFace: $_reApplyFace, _reachAmount: $_reachAmount, _reachTime: $_reachTime, _realReachTime: $_realReachTime, _remainAmount: $_remainAmount, _repaymentAmount: $_repaymentAmount, _repaymentDay: $_repaymentDay, _risk: $_risk, _rolloverFee: $_rolloverFee, _secAppTime: $_secAppTime, _service: $_service}';
  }
}

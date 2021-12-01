// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `电话号码`
  String get phone_number {
    return Intl.message(
      '电话号码',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `验证码`
  String get vCode {
    return Intl.message(
      '验证码',
      name: 'vCode',
      desc: '',
      args: [],
    );
  }

  /// `获取验证码`
  String get getVCode {
    return Intl.message(
      '获取验证码',
      name: 'getVCode',
      desc: '',
      args: [],
    );
  }

  /// `验证码发送成功`
  String get code_send_success {
    return Intl.message(
      '验证码发送成功',
      name: 'code_send_success',
      desc: '',
      args: [],
    );
  }

  /// `登录`
  String get login {
    return Intl.message(
      '登录',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `《隐私政策》`
  String get pp {
    return Intl.message(
      '《隐私政策》',
      name: 'pp',
      desc: '',
      args: [],
    );
  }

  /// `我已仔细阅读并同意遵守:`
  String get rade_success {
    return Intl.message(
      '我已仔细阅读并同意遵守:',
      name: 'rade_success',
      desc: '',
      args: [],
    );
  }

  /// `发送验证码成功！`
  String get send_success {
    return Intl.message(
      '发送验证码成功！',
      name: 'send_success',
      desc: '',
      args: [],
    );
  }

  /// `请勾选隐私政策`
  String get please_selected {
    return Intl.message(
      '请勾选隐私政策',
      name: 'please_selected',
      desc: '',
      args: [],
    );
  }

  /// `我的资料`
  String get my_info {
    return Intl.message(
      '我的资料',
      name: 'my_info',
      desc: '',
      args: [],
    );
  }

  /// `我的贷款`
  String get my_loan {
    return Intl.message(
      '我的贷款',
      name: 'my_loan',
      desc: '',
      args: [],
    );
  }

  /// `客服`
  String get my_call {
    return Intl.message(
      '客服',
      name: 'my_call',
      desc: '',
      args: [],
    );
  }

  /// `关于我们`
  String get about_us {
    return Intl.message(
      '关于我们',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `退出登录`
  String get my_exit {
    return Intl.message(
      '退出登录',
      name: 'my_exit',
      desc: '',
      args: [],
    );
  }

  /// `按时还款，可自动提升额度`
  String get product_tip {
    return Intl.message(
      '按时还款，可自动提升额度',
      name: 'product_tip',
      desc: '',
      args: [],
    );
  }

  /// `当前可借金额`
  String get curr_loan_money {
    return Intl.message(
      '当前可借金额',
      name: 'curr_loan_money',
      desc: '',
      args: [],
    );
  }

  /// `借款期限`
  String get loan_date {
    return Intl.message(
      '借款期限',
      name: 'loan_date',
      desc: '',
      args: [],
    );
  }

  /// `去借款`
  String get go_loan {
    return Intl.message(
      '去借款',
      name: 'go_loan',
      desc: '',
      args: [],
    );
  }

  /// `正在为您尽快审核，请耐心等待，并保持电话畅通`
  String get review_tip {
    return Intl.message(
      '正在为您尽快审核，请耐心等待，并保持电话畅通',
      name: 'review_tip',
      desc: '',
      args: [],
    );
  }

  /// `人脸识别`
  String get face_title {
    return Intl.message(
      '人脸识别',
      name: 'face_title',
      desc: '',
      args: [],
    );
  }

  /// `将进行人脸识别\n进一步保护您的财产安全`
  String get face_tip {
    return Intl.message(
      '将进行人脸识别\n进一步保护您的财产安全',
      name: 'face_tip',
      desc: '',
      args: [],
    );
  }

  /// `认证`
  String get certification {
    return Intl.message(
      '认证',
      name: 'certification',
      desc: '',
      args: [],
    );
  }

  /// `个人信息`
  String get user_info {
    return Intl.message(
      '个人信息',
      name: 'user_info',
      desc: '',
      args: [],
    );
  }

  /// `下一步`
  String get next_tip {
    return Intl.message(
      '下一步',
      name: 'next_tip',
      desc: '',
      args: [],
    );
  }

  /// `请输入`
  String get please_input {
    return Intl.message(
      '请输入',
      name: 'please_input',
      desc: '',
      args: [],
    );
  }

  /// `上传身份证正面`
  String get upload_id_t {
    return Intl.message(
      '上传身份证正面',
      name: 'upload_id_t',
      desc: '',
      args: [],
    );
  }

  /// `身份证号`
  String get id_number {
    return Intl.message(
      '身份证号',
      name: 'id_number',
      desc: '',
      args: [],
    );
  }

  /// `姓名`
  String get name {
    return Intl.message(
      '姓名',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `出生年月`
  String get birthday {
    return Intl.message(
      '出生年月',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `性别`
  String get gender {
    return Intl.message(
      '性别',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `电子邮箱`
  String get email {
    return Intl.message(
      '电子邮箱',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `小名`
  String get nick_name {
    return Intl.message(
      '小名',
      name: 'nick_name',
      desc: '',
      args: [],
    );
  }

  /// `居住类型`
  String get home_type {
    return Intl.message(
      '居住类型',
      name: 'home_type',
      desc: '',
      args: [],
    );
  }

  /// `居住时长`
  String get home_time {
    return Intl.message(
      '居住时长',
      name: 'home_time',
      desc: '',
      args: [],
    );
  }

  /// `居住省份`
  String get home_city {
    return Intl.message(
      '居住省份',
      name: 'home_city',
      desc: '',
      args: [],
    );
  }

  /// `详细地址`
  String get details_address {
    return Intl.message(
      '详细地址',
      name: 'details_address',
      desc: '',
      args: [],
    );
  }

  /// `学历`
  String get education {
    return Intl.message(
      '学历',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `婚姻`
  String get marriage {
    return Intl.message(
      '婚姻',
      name: 'marriage',
      desc: '',
      args: [],
    );
  }

  /// `孩子数`
  String get how_children {
    return Intl.message(
      '孩子数',
      name: 'how_children',
      desc: '',
      args: [],
    );
  }

  /// `职业信息`
  String get work_info {
    return Intl.message(
      '职业信息',
      name: 'work_info',
      desc: '',
      args: [],
    );
  }

  /// `确认申请`
  String get confirm_request {
    return Intl.message(
      '确认申请',
      name: 'confirm_request',
      desc: '',
      args: [],
    );
  }

  /// `您的申请已提交\n请耐心等待审核， 请保持电话联系`
  String get confirm_request_tip {
    return Intl.message(
      '您的申请已提交\n请耐心等待审核， 请保持电话联系',
      name: 'confirm_request_tip',
      desc: '',
      args: [],
    );
  }

  /// `借款金额（泰铢）`
  String get loan_money {
    return Intl.message(
      '借款金额（泰铢）',
      name: 'loan_money',
      desc: '',
      args: [],
    );
  }

  /// `借款金额（泰铢）`
  String get loan_amount {
    return Intl.message(
      '借款金额（泰铢）',
      name: 'loan_amount',
      desc: '',
      args: [],
    );
  }

  /// `借款期限`
  String get loan_period {
    return Intl.message(
      '借款期限',
      name: 'loan_period',
      desc: '',
      args: [],
    );
  }

  /// `请选择`
  String get please_check {
    return Intl.message(
      '请选择',
      name: 'please_check',
      desc: '',
      args: [],
    );
  }

  /// `四角完整`
  String get photo_tip_f {
    return Intl.message(
      '四角完整',
      name: 'photo_tip_f',
      desc: '',
      args: [],
    );
  }

  /// `照片清晰`
  String get photo_tip_s {
    return Intl.message(
      '照片清晰',
      name: 'photo_tip_s',
      desc: '',
      args: [],
    );
  }

  /// `我知道了`
  String get iknow {
    return Intl.message(
      '我知道了',
      name: 'iknow',
      desc: '',
      args: [],
    );
  }

  /// `取消`
  String get cancel {
    return Intl.message(
      '取消',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `确定`
  String get ok {
    return Intl.message(
      '确定',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `您的身份`
  String get job {
    return Intl.message(
      '您的身份',
      name: 'job',
      desc: '',
      args: [],
    );
  }

  /// `请选择您的身份`
  String get select_job {
    return Intl.message(
      '请选择您的身份',
      name: 'select_job',
      desc: '',
      args: [],
    );
  }

  /// `职业类型`
  String get job_type {
    return Intl.message(
      '职业类型',
      name: 'job_type',
      desc: '',
      args: [],
    );
  }

  /// `请选择您的职业`
  String get select_job_type {
    return Intl.message(
      '请选择您的职业',
      name: 'select_job_type',
      desc: '',
      args: [],
    );
  }

  /// `行业分类`
  String get industry {
    return Intl.message(
      '行业分类',
      name: 'industry',
      desc: '',
      args: [],
    );
  }

  /// `请选择您的行业`
  String get select_industry {
    return Intl.message(
      '请选择您的行业',
      name: 'select_industry',
      desc: '',
      args: [],
    );
  }

  /// `收入范围`
  String get salary_range {
    return Intl.message(
      '收入范围',
      name: 'salary_range',
      desc: '',
      args: [],
    );
  }

  /// `请选择您的收入范围`
  String get select_salary_range {
    return Intl.message(
      '请选择您的收入范围',
      name: 'select_salary_range',
      desc: '',
      args: [],
    );
  }

  /// `公司名称`
  String get comp_name {
    return Intl.message(
      '公司名称',
      name: 'comp_name',
      desc: '',
      args: [],
    );
  }

  /// `公司地址`
  String get comp_address {
    return Intl.message(
      '公司地址',
      name: 'comp_address',
      desc: '',
      args: [],
    );
  }

  /// `请选择公司的省份`
  String get select_comp_address {
    return Intl.message(
      '请选择公司的省份',
      name: 'select_comp_address',
      desc: '',
      args: [],
    );
  }

  /// `详细地址`
  String get detail_address {
    return Intl.message(
      '详细地址',
      name: 'detail_address',
      desc: '',
      args: [],
    );
  }

  /// `公司电话`
  String get comp_phone {
    return Intl.message(
      '公司电话',
      name: 'comp_phone',
      desc: '',
      args: [],
    );
  }

  /// `第一联系人`
  String get contact_name_f {
    return Intl.message(
      '第一联系人',
      name: 'contact_name_f',
      desc: '',
      args: [],
    );
  }

  /// `第二联系人`
  String get contact_name_s {
    return Intl.message(
      '第二联系人',
      name: 'contact_name_s',
      desc: '',
      args: [],
    );
  }

  /// `联系人关系`
  String get relationship_with_you {
    return Intl.message(
      '联系人关系',
      name: 'relationship_with_you',
      desc: '',
      args: [],
    );
  }

  /// `联系人电话`
  String get contact_number {
    return Intl.message(
      '联系人电话',
      name: 'contact_number',
      desc: '',
      args: [],
    );
  }

  /// `联系人信息`
  String get contact_info {
    return Intl.message(
      '联系人信息',
      name: 'contact_info',
      desc: '',
      args: [],
    );
  }

  /// `银行卡信息`
  String get card_info {
    return Intl.message(
      '银行卡信息',
      name: 'card_info',
      desc: '',
      args: [],
    );
  }

  /// `持卡人`
  String get cardholder {
    return Intl.message(
      '持卡人',
      name: 'cardholder',
      desc: '',
      args: [],
    );
  }

  /// `银行账号`
  String get bank_account {
    return Intl.message(
      '银行账号',
      name: 'bank_account',
      desc: '',
      args: [],
    );
  }

  /// `开户银行`
  String get open_account_bank {
    return Intl.message(
      '开户银行',
      name: 'open_account_bank',
      desc: '',
      args: [],
    );
  }

  /// `请选择开户银行`
  String get select_open_account_bank {
    return Intl.message(
      '请选择开户银行',
      name: 'select_open_account_bank',
      desc: '',
      args: [],
    );
  }

  /// `省份`
  String get province {
    return Intl.message(
      '省份',
      name: 'province',
      desc: '',
      args: [],
    );
  }

  /// `城市`
  String get city {
    return Intl.message(
      '城市',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `待解锁`
  String get unlocked {
    return Intl.message(
      '待解锁',
      name: 'unlocked',
      desc: '',
      args: [],
    );
  }

  /// `确定退出当前账号？`
  String get exit_app_tip {
    return Intl.message(
      '确定退出当前账号？',
      name: 'exit_app_tip',
      desc: '',
      args: [],
    );
  }

  /// `审核中`
  String get review {
    return Intl.message(
      '审核中',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `申请时间`
  String get review_time {
    return Intl.message(
      '申请时间',
      name: 'review_time',
      desc: '',
      args: [],
    );
  }

  /// `审核未通过`
  String get review_faile {
    return Intl.message(
      '审核未通过',
      name: 'review_faile',
      desc: '',
      args: [],
    );
  }

  /// `待还款`
  String get repay {
    return Intl.message(
      '待还款',
      name: 'repay',
      desc: '',
      args: [],
    );
  }

  /// `已逾期`
  String get over {
    return Intl.message(
      '已逾期',
      name: 'over',
      desc: '',
      args: [],
    );
  }

  /// `已结清`
  String get settle {
    return Intl.message(
      '已结清',
      name: 'settle',
      desc: '',
      args: [],
    );
  }

  /// `应还时间`
  String get reapy_time {
    return Intl.message(
      '应还时间',
      name: 'reapy_time',
      desc: '',
      args: [],
    );
  }

  /// `待还金额`
  String get amount_repaid {
    return Intl.message(
      '待还金额',
      name: 'amount_repaid',
      desc: '',
      args: [],
    );
  }

  /// `还款时间`
  String get pay_time {
    return Intl.message(
      '还款时间',
      name: 'pay_time',
      desc: '',
      args: [],
    );
  }

  /// `已还金额`
  String get pay_money {
    return Intl.message(
      '已还金额',
      name: 'pay_money',
      desc: '',
      args: [],
    );
  }

  /// `您的贷款已经到账，请留意还款时间`
  String get wait_pay_tip {
    return Intl.message(
      '您的贷款已经到账，请留意还款时间',
      name: 'wait_pay_tip',
      desc: '',
      args: [],
    );
  }

  /// `待还金额`
  String get remainAmount {
    return Intl.message(
      '待还金额',
      name: 'remainAmount',
      desc: '',
      args: [],
    );
  }

  /// `应还时间`
  String get depositTime {
    return Intl.message(
      '应还时间',
      name: 'depositTime',
      desc: '',
      args: [],
    );
  }

  /// `利息`
  String get interest {
    return Intl.message(
      '利息',
      name: 'interest',
      desc: '',
      args: [],
    );
  }

  /// `罚息`
  String get penalty {
    return Intl.message(
      '罚息',
      name: 'penalty',
      desc: '',
      args: [],
    );
  }

  /// `滞纳金`
  String get fale_fee {
    return Intl.message(
      '滞纳金',
      name: 'fale_fee',
      desc: '',
      args: [],
    );
  }

  /// `支付费用`
  String get pay {
    return Intl.message(
      '支付费用',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `技术服务费`
  String get risk {
    return Intl.message(
      '技术服务费',
      name: 'risk',
      desc: '',
      args: [],
    );
  }

  /// `审核咨询费`
  String get service {
    return Intl.message(
      '审核咨询费',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `去还款`
  String get to_pay {
    return Intl.message(
      '去还款',
      name: 'to_pay',
      desc: '',
      args: [],
    );
  }

  /// `全部还款`
  String get all_pay {
    return Intl.message(
      '全部还款',
      name: 'all_pay',
      desc: '',
      args: [],
    );
  }

  /// `展期还款`
  String get sub_pay {
    return Intl.message(
      '展期还款',
      name: 'sub_pay',
      desc: '',
      args: [],
    );
  }

  /// `应还金额`
  String get amount_due {
    return Intl.message(
      '应还金额',
      name: 'amount_due',
      desc: '',
      args: [],
    );
  }

  /// `应还展期金额`
  String get sub_amount_due {
    return Intl.message(
      '应还展期金额',
      name: 'sub_amount_due',
      desc: '',
      args: [],
    );
  }

  /// `银行`
  String get bank {
    return Intl.message(
      '银行',
      name: 'bank',
      desc: '',
      args: [],
    );
  }

  /// `银行卡号`
  String get bank_number {
    return Intl.message(
      '银行卡号',
      name: 'bank_number',
      desc: '',
      args: [],
    );
  }

  /// `还款银行账号`
  String get reapay_bank_code {
    return Intl.message(
      '还款银行账号',
      name: 'reapay_bank_code',
      desc: '',
      args: [],
    );
  }

  /// `上传还款凭证`
  String get upload_repayment {
    return Intl.message(
      '上传还款凭证',
      name: 'upload_repayment',
      desc: '',
      args: [],
    );
  }

  /// `还款标志`
  String get repayment_sign {
    return Intl.message(
      '还款标志',
      name: 'repayment_sign',
      desc: '',
      args: [],
    );
  }

  /// `账户名`
  String get account_name {
    return Intl.message(
      '账户名',
      name: 'account_name',
      desc: '',
      args: [],
    );
  }

  /// `还款额`
  String get repay_amo {
    return Intl.message(
      '还款额',
      name: 'repay_amo',
      desc: '',
      args: [],
    );
  }

  /// `展期开始时间`
  String get start_time {
    return Intl.message(
      '展期开始时间',
      name: 'start_time',
      desc: '',
      args: [],
    );
  }

  /// `展期结束时间`
  String get end_time {
    return Intl.message(
      '展期结束时间',
      name: 'end_time',
      desc: '',
      args: [],
    );
  }

  /// `请先点击下一步，再上传还款凭证`
  String get jx_tip {
    return Intl.message(
      '请先点击下一步，再上传还款凭证',
      name: 'jx_tip',
      desc: '',
      args: [],
    );
  }

  /// `提交`
  String get submit {
    return Intl.message(
      '提交',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `还款`
  String get repayment {
    return Intl.message(
      '还款',
      name: 'repayment',
      desc: '',
      args: [],
    );
  }

  /// `还款凭证上传成功，我们将尽快核对\n注意查看您的还款状态`
  String get upload_pay_tip {
    return Intl.message(
      '还款凭证上传成功，我们将尽快核对\n注意查看您的还款状态',
      name: 'upload_pay_tip',
      desc: '',
      args: [],
    );
  }

  /// `选择图片获取方式`
  String get choose_get_photo {
    return Intl.message(
      '选择图片获取方式',
      name: 'choose_get_photo',
      desc: '',
      args: [],
    );
  }

  /// `拍照`
  String get photograph {
    return Intl.message(
      '拍照',
      name: 'photograph',
      desc: '',
      args: [],
    );
  }

  /// `选取相册`
  String get select_album {
    return Intl.message(
      '选取相册',
      name: 'select_album',
      desc: '',
      args: [],
    );
  }

  /// `选择您的还款方式`
  String get select_reapy_method {
    return Intl.message(
      '选择您的还款方式',
      name: 'select_reapy_method',
      desc: '',
      args: [],
    );
  }

  /// `您的申请已被拒绝，请保持信用。七天后再试`
  String get fail_tip {
    return Intl.message(
      '您的申请已被拒绝，请保持信用。七天后再试',
      name: 'fail_tip',
      desc: '',
      args: [],
    );
  }

  /// `您的贷款已逾期，请尽快还款避免产生额外费用`
  String get over_tip {
    return Intl.message(
      '您的贷款已逾期，请尽快还款避免产生额外费用',
      name: 'over_tip',
      desc: '',
      args: [],
    );
  }

  /// `已取消`
  String get order_cancel {
    return Intl.message(
      '已取消',
      name: 'order_cancel',
      desc: '',
      args: [],
    );
  }

  /// `借款`
  String get loan {
    return Intl.message(
      '借款',
      name: 'loan',
      desc: '',
      args: [],
    );
  }

  /// `个人`
  String get main_user {
    return Intl.message(
      '个人',
      name: 'main_user',
      desc: '',
      args: [],
    );
  }

  /// `我的优惠券`
  String get my_coupon {
    return Intl.message(
      '我的优惠券',
      name: 'my_coupon',
      desc: '',
      args: [],
    );
  }

  /// `确定要拨打客服电话？`
  String get call_user_tip {
    return Intl.message(
      '确定要拨打客服电话？',
      name: 'call_user_tip',
      desc: '',
      args: [],
    );
  }

  /// `时间`
  String get time {
    return Intl.message(
      '时间',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `贷款期限`
  String get loan_term {
    return Intl.message(
      '贷款期限',
      name: 'loan_term',
      desc: '',
      args: [],
    );
  }

  /// `立即借钱`
  String get borrow_money_now {
    return Intl.message(
      '立即借钱',
      name: 'borrow_money_now',
      desc: '',
      args: [],
    );
  }

  /// `额度`
  String get quota {
    return Intl.message(
      '额度',
      name: 'quota',
      desc: '',
      args: [],
    );
  }

  /// `最高可借`
  String get highest_loanable {
    return Intl.message(
      '最高可借',
      name: 'highest_loanable',
      desc: '',
      args: [],
    );
  }

  /// `你想借`
  String get you_want_borrow {
    return Intl.message(
      '你想借',
      name: 'you_want_borrow',
      desc: '',
      args: [],
    );
  }

  /// `当前等级暂不可借`
  String get not_money_now {
    return Intl.message(
      '当前等级暂不可借',
      name: 'not_money_now',
      desc: '',
      args: [],
    );
  }

  /// `您的申请已被拒绝,请稍后再试`
  String get start_fail_tip {
    return Intl.message(
      '您的申请已被拒绝,请稍后再试',
      name: 'start_fail_tip',
      desc: '',
      args: [],
    );
  }

  /// `联系人姓名`
  String get contact_name {
    return Intl.message(
      '联系人姓名',
      name: 'contact_name',
      desc: '',
      args: [],
    );
  }

  /// `第三联系人`
  String get contact_name_three {
    return Intl.message(
      '第三联系人',
      name: 'contact_name_three',
      desc: '',
      args: [],
    );
  }

  /// `第四联系人`
  String get contact_name_four {
    return Intl.message(
      '第四联系人',
      name: 'contact_name_four',
      desc: '',
      args: [],
    );
  }

  /// `第五联系人`
  String get contact_name_five {
    return Intl.message(
      '第五联系人',
      name: 'contact_name_five',
      desc: '',
      args: [],
    );
  }

  /// `宗教`
  String get religion {
    return Intl.message(
      '宗教',
      name: 'religion',
      desc: '',
      args: [],
    );
  }

  /// `选择省/市`
  String get select_province {
    return Intl.message(
      '选择省/市',
      name: 'select_province',
      desc: '',
      args: [],
    );
  }

  /// `选择县/区`
  String get select_county {
    return Intl.message(
      '选择县/区',
      name: 'select_county',
      desc: '',
      args: [],
    );
  }

  /// `选择街道`
  String get select_street {
    return Intl.message(
      '选择街道',
      name: 'select_street',
      desc: '',
      args: [],
    );
  }

  /// `位置`
  String get location {
    return Intl.message(
      '位置',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `点击获取定位`
  String get get_location {
    return Intl.message(
      '点击获取定位',
      name: 'get_location',
      desc: '',
      args: [],
    );
  }

  /// `请先选择上一级地址!`
  String get plese_select_superior {
    return Intl.message(
      '请先选择上一级地址!',
      name: 'plese_select_superior',
      desc: '',
      args: [],
    );
  }

  /// `手机号`
  String get bank_phone {
    return Intl.message(
      '手机号',
      name: 'bank_phone',
      desc: '',
      args: [],
    );
  }

  /// `取款方式`
  String get withdrawal_method {
    return Intl.message(
      '取款方式',
      name: 'withdrawal_method',
      desc: '',
      args: [],
    );
  }

  /// `确认贷款`
  String get confirm_loan {
    return Intl.message(
      '确认贷款',
      name: 'confirm_loan',
      desc: '',
      args: [],
    );
  }

  /// `订单信息`
  String get order_info {
    return Intl.message(
      '订单信息',
      name: 'order_info',
      desc: '',
      args: [],
    );
  }

  /// `天`
  String get day {
    return Intl.message(
      '天',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Attention！For late repayment，thebelow fees will be applied.`
  String get comfirm_tip {
    return Intl.message(
      'Attention！For late repayment，thebelow fees will be applied.',
      name: 'comfirm_tip',
      desc: '',
      args: [],
    );
  }

  /// `取款账号`
  String get withdrawal_method_number {
    return Intl.message(
      '取款账号',
      name: 'withdrawal_method_number',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get account_Information {
    return Intl.message(
      'Account Information',
      name: 'account_Information',
      desc: '',
      args: [],
    );
  }

  /// `* Please ensure the ID uploaded matches with the ID Type previously selected.`
  String get id_card_tip {
    return Intl.message(
      '* Please ensure the ID uploaded matches with the ID Type previously selected.',
      name: 'id_card_tip',
      desc: '',
      args: [],
    );
  }

  /// `请拍摄工作证明(或以下其一)`
  String get take_photo_tip {
    return Intl.message(
      '请拍摄工作证明(或以下其一)',
      name: 'take_photo_tip',
      desc: '',
      args: [],
    );
  }

  /// `1. 工资单`
  String get payroll {
    return Intl.message(
      '1. 工资单',
      name: 'payroll',
      desc: '',
      args: [],
    );
  }

  /// `2. 工作证`
  String get work_permit {
    return Intl.message(
      '2. 工作证',
      name: 'work_permit',
      desc: '',
      args: [],
    );
  }

  /// `3. 驾驶执照（摩托车/汽车）`
  String get driving_license {
    return Intl.message(
      '3. 驾驶执照（摩托车/汽车）',
      name: 'driving_license',
      desc: '',
      args: [],
    );
  }

  /// `4. 工作场所照片`
  String get work_place_photo {
    return Intl.message(
      '4. 工作场所照片',
      name: 'work_place_photo',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

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

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get vCode {
    return Intl.message(
      'Verification Code',
      name: 'vCode',
      desc: '',
      args: [],
    );
  }

  /// `Get Verification Code`
  String get getVCode {
    return Intl.message(
      'Get Verification Code',
      name: 'getVCode',
      desc: '',
      args: [],
    );
  }

  /// `Verification code sent successfully`
  String get code_send_success {
    return Intl.message(
      'Verification code sent successfully',
      name: 'code_send_success',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get pp {
    return Intl.message(
      'Privacy Policy',
      name: 'pp',
      desc: '',
      args: [],
    );
  }

  /// `I have read carefully and agree to abide by:`
  String get rade_success {
    return Intl.message(
      'I have read carefully and agree to abide by:',
      name: 'rade_success',
      desc: '',
      args: [],
    );
  }

  /// `Send verification code successfully!`
  String get send_success {
    return Intl.message(
      'Send verification code successfully!',
      name: 'send_success',
      desc: '',
      args: [],
    );
  }

  /// `Please tick the privacy policy`
  String get please_selected {
    return Intl.message(
      'Please tick the privacy policy',
      name: 'please_selected',
      desc: '',
      args: [],
    );
  }

  /// `My Info`
  String get my_info {
    return Intl.message(
      'My Info',
      name: 'my_info',
      desc: '',
      args: [],
    );
  }

  /// `My Loan`
  String get my_loan {
    return Intl.message(
      'My Loan',
      name: 'my_loan',
      desc: '',
      args: [],
    );
  }

  /// `Customer Service`
  String get my_call {
    return Intl.message(
      'Customer Service',
      name: 'my_call',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about_us {
    return Intl.message(
      'About Us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get my_exit {
    return Intl.message(
      'Sign out',
      name: 'my_exit',
      desc: '',
      args: [],
    );
  }

  /// `Repay on time, the amount can be automatically increased`
  String get product_tip {
    return Intl.message(
      'Repay on time, the amount can be automatically increased',
      name: 'product_tip',
      desc: '',
      args: [],
    );
  }

  /// `Current loan amount`
  String get curr_loan_money {
    return Intl.message(
      'Current loan amount',
      name: 'curr_loan_money',
      desc: '',
      args: [],
    );
  }

  /// `Loan period`
  String get loan_date {
    return Intl.message(
      'Loan period',
      name: 'loan_date',
      desc: '',
      args: [],
    );
  }

  /// `Go Loan`
  String get go_loan {
    return Intl.message(
      'Go Loan',
      name: 'go_loan',
      desc: '',
      args: [],
    );
  }

  /// `Reviewing for you as soon as possible, please be patient and keep the phone open`
  String get review_tip {
    return Intl.message(
      'Reviewing for you as soon as possible, please be patient and keep the phone open',
      name: 'review_tip',
      desc: '',
      args: [],
    );
  }

  /// `Face Recognition`
  String get face_title {
    return Intl.message(
      'Face Recognition',
      name: 'face_title',
      desc: '',
      args: [],
    );
  }

  /// `Face recognition will be performed\nto further protect your property`
  String get face_tip {
    return Intl.message(
      'Face recognition will be performed\nto further protect your property',
      name: 'face_tip',
      desc: '',
      args: [],
    );
  }

  /// `Certification`
  String get certification {
    return Intl.message(
      'Certification',
      name: 'certification',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get user_info {
    return Intl.message(
      'Personal Information',
      name: 'user_info',
      desc: '',
      args: [],
    );
  }

  /// `Next step`
  String get next_tip {
    return Intl.message(
      'Next step',
      name: 'next_tip',
      desc: '',
      args: [],
    );
  }

  /// `Please input`
  String get please_input {
    return Intl.message(
      'Please input',
      name: 'please_input',
      desc: '',
      args: [],
    );
  }

  /// `Upload front of ID card`
  String get upload_id_t {
    return Intl.message(
      'Upload front of ID card',
      name: 'upload_id_t',
      desc: '',
      args: [],
    );
  }

  /// `ID number`
  String get id_number {
    return Intl.message(
      'ID number',
      name: 'id_number',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Birthdate`
  String get birthday {
    return Intl.message(
      'Birthdate',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `gender`
  String get gender {
    return Intl.message(
      'gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `nickname`
  String get nick_name {
    return Intl.message(
      'nickname',
      name: 'nick_name',
      desc: '',
      args: [],
    );
  }

  /// `Housing Type`
  String get home_type {
    return Intl.message(
      'Housing Type',
      name: 'home_type',
      desc: '',
      args: [],
    );
  }

  /// `Home Time`
  String get home_time {
    return Intl.message(
      'Home Time',
      name: 'home_time',
      desc: '',
      args: [],
    );
  }

  /// `Home Province`
  String get home_city {
    return Intl.message(
      'Home Province',
      name: 'home_city',
      desc: '',
      args: [],
    );
  }

  /// `Details Address`
  String get details_address {
    return Intl.message(
      'Details Address',
      name: 'details_address',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `marriage`
  String get marriage {
    return Intl.message(
      'marriage',
      name: 'marriage',
      desc: '',
      args: [],
    );
  }

  /// `Number of children`
  String get how_children {
    return Intl.message(
      'Number of children',
      name: 'how_children',
      desc: '',
      args: [],
    );
  }

  /// `Job Information`
  String get work_info {
    return Intl.message(
      'Job Information',
      name: 'work_info',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Request`
  String get confirm_request {
    return Intl.message(
      'Confirm Request',
      name: 'confirm_request',
      desc: '',
      args: [],
    );
  }

  /// `Your application has been submitted\nPlease be patient for review, please keep in touch`
  String get confirm_request_tip {
    return Intl.message(
      'Your application has been submitted\nPlease be patient for review, please keep in touch',
      name: 'confirm_request_tip',
      desc: '',
      args: [],
    );
  }

  /// `Loan Amount (Thai Baht)`
  String get loan_money {
    return Intl.message(
      'Loan Amount (Thai Baht)',
      name: 'loan_money',
      desc: '',
      args: [],
    );
  }

  /// `Loan Amount (Thai Baht)`
  String get loan_amount {
    return Intl.message(
      'Loan Amount (Thai Baht)',
      name: 'loan_amount',
      desc: '',
      args: [],
    );
  }

  /// `Loan period`
  String get loan_period {
    return Intl.message(
      'Loan period',
      name: 'loan_period',
      desc: '',
      args: [],
    );
  }

  /// `Please select`
  String get please_check {
    return Intl.message(
      'Please select',
      name: 'please_check',
      desc: '',
      args: [],
    );
  }

  /// `Four corners complete`
  String get photo_tip_f {
    return Intl.message(
      'Four corners complete',
      name: 'photo_tip_f',
      desc: '',
      args: [],
    );
  }

  /// `Photos are clear`
  String get photo_tip_s {
    return Intl.message(
      'Photos are clear',
      name: 'photo_tip_s',
      desc: '',
      args: [],
    );
  }

  /// `I know`
  String get iknow {
    return Intl.message(
      'I know',
      name: 'iknow',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `your identity`
  String get job {
    return Intl.message(
      'your identity',
      name: 'job',
      desc: '',
      args: [],
    );
  }

  /// `Please select your job`
  String get select_job {
    return Intl.message(
      'Please select your job',
      name: 'select_job',
      desc: '',
      args: [],
    );
  }

  /// `Job Type`
  String get job_type {
    return Intl.message(
      'Job Type',
      name: 'job_type',
      desc: '',
      args: [],
    );
  }

  /// `Please select your job`
  String get select_job_type {
    return Intl.message(
      'Please select your job',
      name: 'select_job_type',
      desc: '',
      args: [],
    );
  }

  /// `Industry Classification`
  String get industry {
    return Intl.message(
      'Industry Classification',
      name: 'industry',
      desc: '',
      args: [],
    );
  }

  /// `Please select your industry`
  String get select_industry {
    return Intl.message(
      'Please select your industry',
      name: 'select_industry',
      desc: '',
      args: [],
    );
  }

  /// `Revenue Range`
  String get salary_range {
    return Intl.message(
      'Revenue Range',
      name: 'salary_range',
      desc: '',
      args: [],
    );
  }

  /// `Please select your income range`
  String get select_salary_range {
    return Intl.message(
      'Please select your income range',
      name: 'select_salary_range',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get comp_name {
    return Intl.message(
      'Company Name',
      name: 'comp_name',
      desc: '',
      args: [],
    );
  }

  /// `Company Address`
  String get comp_address {
    return Intl.message(
      'Company Address',
      name: 'comp_address',
      desc: '',
      args: [],
    );
  }

  /// `Please select the company's province`
  String get select_comp_address {
    return Intl.message(
      'Please select the company\'s province',
      name: 'select_comp_address',
      desc: '',
      args: [],
    );
  }

  /// `Detailed address`
  String get detail_address {
    return Intl.message(
      'Detailed address',
      name: 'detail_address',
      desc: '',
      args: [],
    );
  }

  /// `Company Phone`
  String get comp_phone {
    return Intl.message(
      'Company Phone',
      name: 'comp_phone',
      desc: '',
      args: [],
    );
  }

  /// `First Contact`
  String get contact_name_f {
    return Intl.message(
      'First Contact',
      name: 'contact_name_f',
      desc: '',
      args: [],
    );
  }

  /// `Secondary Contact`
  String get contact_name_s {
    return Intl.message(
      'Secondary Contact',
      name: 'contact_name_s',
      desc: '',
      args: [],
    );
  }

  /// `Contact relationship`
  String get relationship_with_you {
    return Intl.message(
      'Contact relationship',
      name: 'relationship_with_you',
      desc: '',
      args: [],
    );
  }

  /// `Contact phone number`
  String get contact_number {
    return Intl.message(
      'Contact phone number',
      name: 'contact_number',
      desc: '',
      args: [],
    );
  }

  /// `Contact Info`
  String get contact_info {
    return Intl.message(
      'Contact Info',
      name: 'contact_info',
      desc: '',
      args: [],
    );
  }

  /// `Bank Card Information`
  String get card_info {
    return Intl.message(
      'Bank Card Information',
      name: 'card_info',
      desc: '',
      args: [],
    );
  }

  /// `Cardholder`
  String get cardholder {
    return Intl.message(
      'Cardholder',
      name: 'cardholder',
      desc: '',
      args: [],
    );
  }

  /// `Bank Account Number`
  String get bank_account {
    return Intl.message(
      'Bank Account Number',
      name: 'bank_account',
      desc: '',
      args: [],
    );
  }

  /// `Open Account Bank`
  String get open_account_bank {
    return Intl.message(
      'Open Account Bank',
      name: 'open_account_bank',
      desc: '',
      args: [],
    );
  }

  /// `Please select an account opening bank`
  String get select_open_account_bank {
    return Intl.message(
      'Please select an account opening bank',
      name: 'select_open_account_bank',
      desc: '',
      args: [],
    );
  }

  /// `Province`
  String get province {
    return Intl.message(
      'Province',
      name: 'province',
      desc: '',
      args: [],
    );
  }

  /// `city`
  String get city {
    return Intl.message(
      'city',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `To be unlocked`
  String get unlocked {
    return Intl.message(
      'To be unlocked',
      name: 'unlocked',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exit the current account?`
  String get exit_app_tip {
    return Intl.message(
      'Are you sure you want to exit the current account?',
      name: 'exit_app_tip',
      desc: '',
      args: [],
    );
  }

  /// `Reviewing`
  String get review {
    return Intl.message(
      'Reviewing',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Review time`
  String get review_time {
    return Intl.message(
      'Review time',
      name: 'review_time',
      desc: '',
      args: [],
    );
  }

  /// `Review failed`
  String get review_faile {
    return Intl.message(
      'Review failed',
      name: 'review_faile',
      desc: '',
      args: [],
    );
  }

  /// `Pending payment`
  String get repay {
    return Intl.message(
      'Pending payment',
      name: 'repay',
      desc: '',
      args: [],
    );
  }

  /// `Overdue`
  String get over {
    return Intl.message(
      'Overdue',
      name: 'over',
      desc: '',
      args: [],
    );
  }

  /// `Cleared`
  String get settle {
    return Intl.message(
      'Cleared',
      name: 'settle',
      desc: '',
      args: [],
    );
  }

  /// `Repay time`
  String get reapy_time {
    return Intl.message(
      'Repay time',
      name: 'reapy_time',
      desc: '',
      args: [],
    );
  }

  /// `Amount to be repaid`
  String get amount_repaid {
    return Intl.message(
      'Amount to be repaid',
      name: 'amount_repaid',
      desc: '',
      args: [],
    );
  }

  /// `Payment time`
  String get pay_time {
    return Intl.message(
      'Payment time',
      name: 'pay_time',
      desc: '',
      args: [],
    );
  }

  /// `Payment amount`
  String get pay_money {
    return Intl.message(
      'Payment amount',
      name: 'pay_money',
      desc: '',
      args: [],
    );
  }

  /// `Your loan has arrived, please pay attention to the repayment time`
  String get wait_pay_tip {
    return Intl.message(
      'Your loan has arrived, please pay attention to the repayment time',
      name: 'wait_pay_tip',
      desc: '',
      args: [],
    );
  }

  /// `Amount to be repaid`
  String get remainAmount {
    return Intl.message(
      'Amount to be repaid',
      name: 'remainAmount',
      desc: '',
      args: [],
    );
  }

  /// `Deposit Time`
  String get depositTime {
    return Intl.message(
      'Deposit Time',
      name: 'depositTime',
      desc: '',
      args: [],
    );
  }

  /// `interest`
  String get interest {
    return Intl.message(
      'interest',
      name: 'interest',
      desc: '',
      args: [],
    );
  }

  /// `Penalty Interest`
  String get penalty {
    return Intl.message(
      'Penalty Interest',
      name: 'penalty',
      desc: '',
      args: [],
    );
  }

  /// `Late Payment Fee`
  String get fale_fee {
    return Intl.message(
      'Late Payment Fee',
      name: 'fale_fee',
      desc: '',
      args: [],
    );
  }

  /// `Payment fee`
  String get pay {
    return Intl.message(
      'Payment fee',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Technical service fee`
  String get risk {
    return Intl.message(
      'Technical service fee',
      name: 'risk',
      desc: '',
      args: [],
    );
  }

  /// `Audit Consulting Fee`
  String get service {
    return Intl.message(
      'Audit Consulting Fee',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `To repay`
  String get to_pay {
    return Intl.message(
      'To repay',
      name: 'to_pay',
      desc: '',
      args: [],
    );
  }

  /// `Full payment`
  String get all_pay {
    return Intl.message(
      'Full payment',
      name: 'all_pay',
      desc: '',
      args: [],
    );
  }

  /// `Rollover repayment`
  String get sub_pay {
    return Intl.message(
      'Rollover repayment',
      name: 'sub_pay',
      desc: '',
      args: [],
    );
  }

  /// `Amount due`
  String get amount_due {
    return Intl.message(
      'Amount due',
      name: 'amount_due',
      desc: '',
      args: [],
    );
  }

  /// `Amount to be repaid`
  String get sub_amount_due {
    return Intl.message(
      'Amount to be repaid',
      name: 'sub_amount_due',
      desc: '',
      args: [],
    );
  }

  /// `Bank`
  String get bank {
    return Intl.message(
      'Bank',
      name: 'bank',
      desc: '',
      args: [],
    );
  }

  /// `Bank Card Number`
  String get bank_number {
    return Intl.message(
      'Bank Card Number',
      name: 'bank_number',
      desc: '',
      args: [],
    );
  }

  /// `Repayment bank account number`
  String get reapay_bank_code {
    return Intl.message(
      'Repayment bank account number',
      name: 'reapay_bank_code',
      desc: '',
      args: [],
    );
  }

  /// `Upload repayment voucher`
  String get upload_repayment {
    return Intl.message(
      'Upload repayment voucher',
      name: 'upload_repayment',
      desc: '',
      args: [],
    );
  }

  /// `Repayment Sign`
  String get repayment_sign {
    return Intl.message(
      'Repayment Sign',
      name: 'repayment_sign',
      desc: '',
      args: [],
    );
  }

  /// `Account Name`
  String get account_name {
    return Intl.message(
      'Account Name',
      name: 'account_name',
      desc: '',
      args: [],
    );
  }

  /// `Repayment Amount`
  String get repay_amo {
    return Intl.message(
      'Repayment Amount',
      name: 'repay_amo',
      desc: '',
      args: [],
    );
  }

  /// `Extension start time`
  String get start_time {
    return Intl.message(
      'Extension start time',
      name: 'start_time',
      desc: '',
      args: [],
    );
  }

  /// `Extension end time`
  String get end_time {
    return Intl.message(
      'Extension end time',
      name: 'end_time',
      desc: '',
      args: [],
    );
  }

  /// `Please click next, and then upload the repayment voucher`
  String get jx_tip {
    return Intl.message(
      'Please click next, and then upload the repayment voucher',
      name: 'jx_tip',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Repayment`
  String get repayment {
    return Intl.message(
      'Repayment',
      name: 'repayment',
      desc: '',
      args: [],
    );
  }

  /// `The repayment voucher is uploaded successfully, we will check it as soon as possible\nPay attention to check your repayment status`
  String get upload_pay_tip {
    return Intl.message(
      'The repayment voucher is uploaded successfully, we will check it as soon as possible\nPay attention to check your repayment status',
      name: 'upload_pay_tip',
      desc: '',
      args: [],
    );
  }

  /// `Choose how to get picture`
  String get choose_get_photo {
    return Intl.message(
      'Choose how to get picture',
      name: 'choose_get_photo',
      desc: '',
      args: [],
    );
  }

  /// `Photograph`
  String get photograph {
    return Intl.message(
      'Photograph',
      name: 'photograph',
      desc: '',
      args: [],
    );
  }

  /// `Select Album`
  String get select_album {
    return Intl.message(
      'Select Album',
      name: 'select_album',
      desc: '',
      args: [],
    );
  }

  /// `Select your repayment method`
  String get select_reapy_method {
    return Intl.message(
      'Select your repayment method',
      name: 'select_reapy_method',
      desc: '',
      args: [],
    );
  }

  /// `Your application has been rejected, please keep your credit. Try again in seven days`
  String get fail_tip {
    return Intl.message(
      'Your application has been rejected, please keep your credit. Try again in seven days',
      name: 'fail_tip',
      desc: '',
      args: [],
    );
  }

  /// `Your loan is overdue, please repay as soon as possible to avoid extra charges`
  String get over_tip {
    return Intl.message(
      'Your loan is overdue, please repay as soon as possible to avoid extra charges',
      name: 'over_tip',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get order_cancel {
    return Intl.message(
      'Canceled',
      name: 'order_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Loan`
  String get loan {
    return Intl.message(
      'Loan',
      name: 'loan',
      desc: '',
      args: [],
    );
  }

  /// `Personal`
  String get main_user {
    return Intl.message(
      'Personal',
      name: 'main_user',
      desc: '',
      args: [],
    );
  }

  /// `My Coupon`
  String get my_coupon {
    return Intl.message(
      'My Coupon',
      name: 'my_coupon',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to call customer service?`
  String get call_user_tip {
    return Intl.message(
      'Are you sure you want to call customer service?',
      name: 'call_user_tip',
      desc: '',
      args: [],
    );
  }

  /// `time`
  String get time {
    return Intl.message(
      'time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Loan Term`
  String get loan_term {
    return Intl.message(
      'Loan Term',
      name: 'loan_term',
      desc: '',
      args: [],
    );
  }

  /// `Borrow money now`
  String get borrow_money_now {
    return Intl.message(
      'Borrow money now',
      name: 'borrow_money_now',
      desc: '',
      args: [],
    );
  }

  /// `Quota`
  String get quota {
    return Intl.message(
      'Quota',
      name: 'quota',
      desc: '',
      args: [],
    );
  }

  /// `Highest Loanable`
  String get highest_loanable {
    return Intl.message(
      'Highest Loanable',
      name: 'highest_loanable',
      desc: '',
      args: [],
    );
  }

  /// `You want to borrow`
  String get you_want_borrow {
    return Intl.message(
      'You want to borrow',
      name: 'you_want_borrow',
      desc: '',
      args: [],
    );
  }

  /// `Current level cannot be borrowed temporarily`
  String get not_money_now {
    return Intl.message(
      'Current level cannot be borrowed temporarily',
      name: 'not_money_now',
      desc: '',
      args: [],
    );
  }

  /// `Your application has been rejected, please try again later`
  String get start_fail_tip {
    return Intl.message(
      'Your application has been rejected, please try again later',
      name: 'start_fail_tip',
      desc: '',
      args: [],
    );
  }

  /// `contact name`
  String get contact_name {
    return Intl.message(
      'contact name',
      name: 'contact_name',
      desc: '',
      args: [],
    );
  }

  /// `Third Contact`
  String get contact_name_three {
    return Intl.message(
      'Third Contact',
      name: 'contact_name_three',
      desc: '',
      args: [],
    );
  }

  /// `Fourth Contact`
  String get contact_name_four {
    return Intl.message(
      'Fourth Contact',
      name: 'contact_name_four',
      desc: '',
      args: [],
    );
  }

  /// `Fifth Contact`
  String get contact_name_five {
    return Intl.message(
      'Fifth Contact',
      name: 'contact_name_five',
      desc: '',
      args: [],
    );
  }

  /// `Religion`
  String get religion {
    return Intl.message(
      'Religion',
      name: 'religion',
      desc: '',
      args: [],
    );
  }

  /// `Select Province/City`
  String get select_province {
    return Intl.message(
      'Select Province/City',
      name: 'select_province',
      desc: '',
      args: [],
    );
  }

  /// `Select County/District`
  String get select_county {
    return Intl.message(
      'Select County/District',
      name: 'select_county',
      desc: '',
      args: [],
    );
  }

  /// `Select Street`
  String get select_street {
    return Intl.message(
      'Select Street',
      name: 'select_street',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Click to get location`
  String get get_location {
    return Intl.message(
      'Click to get location',
      name: 'get_location',
      desc: '',
      args: [],
    );
  }

  /// `Please select the superior address first!`
  String get plese_select_superior {
    return Intl.message(
      'Please select the superior address first!',
      name: 'plese_select_superior',
      desc: '',
      args: [],
    );
  }

  /// `Mobile phone number`
  String get bank_phone {
    return Intl.message(
      'Mobile phone number',
      name: 'bank_phone',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal method`
  String get withdrawal_method {
    return Intl.message(
      'Withdrawal method',
      name: 'withdrawal_method',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Loan`
  String get confirm_loan {
    return Intl.message(
      'Confirm Loan',
      name: 'confirm_loan',
      desc: '',
      args: [],
    );
  }

  /// `Order Information`
  String get order_info {
    return Intl.message(
      'Order Information',
      name: 'order_info',
      desc: '',
      args: [],
    );
  }

  /// `day`
  String get day {
    return Intl.message(
      'day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Attention! For late repayment, the below fees will be applied.`
  String get comfirm_tip {
    return Intl.message(
      'Attention! For late repayment, the below fees will be applied.',
      name: 'comfirm_tip',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal account number`
  String get withdrawal_method_number {
    return Intl.message(
      'Withdrawal account number',
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

  /// `Please take a photo of your work certificate (or one of the following)`
  String get take_photo_tip {
    return Intl.message(
      'Please take a photo of your work certificate (or one of the following)',
      name: 'take_photo_tip',
      desc: '',
      args: [],
    );
  }

  /// `1. Payroll`
  String get payroll {
    return Intl.message(
      '1. Payroll',
      name: 'payroll',
      desc: '',
      args: [],
    );
  }

  /// `2. Work Permit`
  String get work_permit {
    return Intl.message(
      '2. Work Permit',
      name: 'work_permit',
      desc: '',
      args: [],
    );
  }

  /// `3. Driving license (motorcycle/car)`
  String get driving_license {
    return Intl.message(
      '3. Driving license (motorcycle/car)',
      name: 'driving_license',
      desc: '',
      args: [],
    );
  }

  /// `4. Workplace photo`
  String get work_place_photo {
    return Intl.message(
      '4. Workplace photo',
      name: 'work_place_photo',
      desc: '',
      args: [],
    );
  }

  /// `Loan Amount`
  String get loan_amount_main {
    return Intl.message(
      'Loan Amount',
      name: 'loan_amount_main',
      desc: '',
      args: [],
    );
  }

  /// `Repayment Date`
  String get repayment_date {
    return Intl.message(
      'Repayment Date',
      name: 'repayment_date',
      desc: '',
      args: [],
    );
  }

  /// `There is still until the repayment date`
  String get until_date {
    return Intl.message(
      'There is still until the repayment date',
      name: 'until_date',
      desc: '',
      args: [],
    );
  }

  /// `Repayment Bank`
  String get repayment_bank {
    return Intl.message(
      'Repayment Bank',
      name: 'repayment_bank',
      desc: '',
      args: [],
    );
  }

  /// `Repayment digital code`
  String get repayment_digital_code {
    return Intl.message(
      'Repayment digital code',
      name: 'repayment_digital_code',
      desc: '',
      args: [],
    );
  }

  /// `Repayment QR code`
  String get repayment_digital_qr {
    return Intl.message(
      'Repayment QR code',
      name: 'repayment_digital_qr',
      desc: '',
      args: [],
    );
  }

  /// `Tell the clerk: Pay Bills to Skypay`
  String get skypay_tip {
    return Intl.message(
      'Tell the clerk: Pay Bills to Skypay',
      name: 'skypay_tip',
      desc: '',
      args: [],
    );
  }

  /// `《Loan agreement》`
  String get loanAgreement {
    return Intl.message(
      '《Loan agreement》',
      name: 'loanAgreement',
      desc: '',
      args: [],
    );
  }

  /// `《dislosure “statement” and amortization table》`
  String get dislosureStatement {
    return Intl.message(
      '《dislosure “statement” and amortization table》',
      name: 'dislosureStatement',
      desc: '',
      args: [],
    );
  }

  /// `Loaning`
  String get loan_str {
    return Intl.message(
      'Loaning',
      name: 'loan_str',
      desc: '',
      args: [],
    );
  }

  /// `Your loan has been approved`
  String get loan_title {
    return Intl.message(
      'Your loan has been approved',
      name: 'loan_title',
      desc: '',
      args: [],
    );
  }

  /// `Amount arrived`
  String get amount_arrived {
    return Intl.message(
      'Amount arrived',
      name: 'amount_arrived',
      desc: '',
      args: [],
    );
  }

  /// `Tell the clerk: Money From SkyBridge Payment Inc.`
  String get money_tip {
    return Intl.message(
      'Tell the clerk: Money From SkyBridge Payment Inc.',
      name: 'money_tip',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal QR code`
  String get withdrawal_qr {
    return Intl.message(
      'Withdrawal QR code',
      name: 'withdrawal_qr',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal digital code`
  String get withdrawal_digital_code {
    return Intl.message(
      'Withdrawal digital code',
      name: 'withdrawal_digital_code',
      desc: '',
      args: [],
    );
  }

  /// `No order yet`
  String get not_order {
    return Intl.message(
      'No order yet',
      name: 'not_order',
      desc: '',
      args: [],
    );
  }

  /// `Not used`
  String get not_use {
    return Intl.message(
      'Not used',
      name: 'not_use',
      desc: '',
      args: [],
    );
  }

  /// `used`
  String get used {
    return Intl.message(
      'used',
      name: 'used',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get expired {
    return Intl.message(
      'Expired',
      name: 'expired',
      desc: '',
      args: [],
    );
  }

  /// `Look for updates`
  String get look_new {
    return Intl.message(
      'Look for updates',
      name: 'look_new',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get pp_str {
    return Intl.message(
      'Privacy Policy',
      name: 'pp_str',
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

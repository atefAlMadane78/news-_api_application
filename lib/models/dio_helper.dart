import 'package:dio/dio.dart';
//https://newsapi.org/v2/everything?domains=wsj.com&apiKey=API_KEY
class dioHelper{
  static late Dio  dio;
  static init(){
    dio= Dio(
      BaseOptions(
        baseUrl: 'https://api.goperigon.com/',//'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getData({
    required String url ,
    required Map<String, dynamic> query,
  })async
  {
   return await dio.get(url , queryParameters: query);
  }
}
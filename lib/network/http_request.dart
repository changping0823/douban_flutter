import 'package:dio/dio.dart';
import 'http_config.dart';

class HttpRequest {

  static  BaseOptions baseOption = BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: TIMEOUT
  );

  static final dio = Dio(baseOption);


  static Future request(String url,{String method = 'get',Map<String,dynamic>params})async{
    /// 网络请求方式‘get’或‘post’
    Options option = Options(method: method);
    print('http_url -----> $BASE_URL$url');

    try {
      final result = await dio.request(url,queryParameters: params,options: option);
      return result;
      
    } on DioError catch (err) {
      throw err;
    }

  }
}
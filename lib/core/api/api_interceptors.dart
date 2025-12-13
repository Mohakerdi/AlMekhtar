import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['lang'] = 'ar' / 'en'

    super.onRequest(options, handler);
  }
}
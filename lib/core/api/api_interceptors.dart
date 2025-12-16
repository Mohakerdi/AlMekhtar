import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['lang'] = 'ar' / 'en';
    options.headers['Accept'] = 'application/json';
    options.headers['Content-type'] = 'application/json';

    super.onRequest(options, handler);
  }
}
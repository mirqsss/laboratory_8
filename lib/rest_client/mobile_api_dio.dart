import 'package:dio/dio.dart';
import 'package:dio/io.dart'; 
import 'package:flutter/foundation.dart'; 

class MobileApiDio {
  static late MobileApiDio _instance;
  late Dio _http;

  static get instance {
    _instance = MobileApiDio._internal();
    return _instance;
  }

  MobileApiDio._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
      // Удален sendTimeout
      contentType: 'application/x-www-form-urlencoded',
    );

    _http = Dio(options);

    
    if (!kIsWeb) {
      _http.httpClientAdapter = IOHttpClientAdapter(); 
    }
  }

  factory MobileApiDio() => MobileApiDio._internal();

  get client => _http;

  dispose() {
    _http.close();
  }
}
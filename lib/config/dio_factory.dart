import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_app/constants/app_strings.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  Dio getDio() {
    Dio dio = Dio();

    dio.options = BaseOptions(
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },  
        baseUrl: AppStrings.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20 * 1000), // 60 seconds
        receiveTimeout: const Duration(seconds: 20 * 1000));

    // dio = Dio(options);

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../utils/constants.dart';

class DioFactory {
  const DioFactory();

  Future<Dio> createDio() async {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: Constants.headers,
      connectTimeout: Constants.apiTimeout,
      receiveTimeout: Constants.apiTimeout,
    );

    if(kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
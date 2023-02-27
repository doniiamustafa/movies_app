import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/constants/app_strings.dart';
import 'package:movies_app/data/models/characters.dart';

class CharactersWebservices {
  late Dio dio;

  CharactersWebservices() {
    BaseOptions options = BaseOptions(
        baseUrl: AppStrings.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20 * 1000), // 60 seconds
        receiveTimeout: const Duration(seconds: 20 * 1000));

    dio = Dio(options);
  }

  Future<Characters> getAllCharacters() async {
    Response response = await dio.get(AppStrings.getAllCharactersEndpoint);
    log(response.data);
    return response.data;
  }
}

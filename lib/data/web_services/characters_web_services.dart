// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:movies_app/constants/app_strings.dart';
// import 'package:movies_app/data/models/all_characters.dart';

// class CharactersWebservices {
//   late Dio dio;

//   CharactersWebservices() {
//     BaseOptions options = BaseOptions(
//         baseUrl: AppStrings.baseUrl,
//         receiveDataWhenStatusError: true,
//         connectTimeout: const Duration(seconds: 20 * 1000), // 60 seconds
//         receiveTimeout: const Duration(seconds: 20 * 1000));

//     dio = Dio(options);
//   }

//   Future<AllCharacters> getAllCharacters() async {
//     try {
//       Response response = await dio.get('characters');
//       final response2 = response.data.toString();
//       log("web services response ${response2}");
//       log(response.statusCode.toString());
//       return response.data;
//     } catch (e) {
//       log(e.toString());
//       return AllCharacters(
//           info: Info(
//             count: 10,
//             next: "",
//             pages: 8,
//           ),
//           results: []);
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:movies_app/constants/app_strings.dart';
import 'package:movies_app/data/web_services/response.dart';
import 'package:retrofit/retrofit.dart';

part 'web_service_retrofit.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET(AppStrings.getAllCharactersEndpoint)
  Future<AllCharactersResponse> getCharacters();

  @GET(AppStrings.multipleLocation)
  Future getLocation();
}

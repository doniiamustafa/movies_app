import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/config/dio_factory.dart';
import 'package:movies_app/data/repository/characters_repository.dart';
import 'package:movies_app/data/web_services/web_service_retrofit.dart';

final instance = GetIt.instance;
GetIt getIt = GetIt.I;

initLaunching() async {
  // lazem initializa diofactory el awel w b3d kda el dio
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();

  if (!GetIt.I.isRegistered<WebServices>()) {
    instance.registerLazySingleton<WebServices>(
      () => WebServices(dio),
    );
  }

  if (!GetIt.I.isRegistered<CharactersRepository>()) {
    instance.registerLazySingleton<CharactersRepository>(
      () => CharactersRepository(
        WebServices(dio),
      ),
    );
  }
  // if (!GetIt.I.isRegistered<CharactersCubit>()) {
  //   instance.registerLazySingleton<CharactersCubit>(
  //     () => CharactersCubit(
  //       instance(),
  //     ),
  //   );
  // }
}

import 'package:breaking_bad_app/data/repos/imports.dart';
import 'package:breaking_bad_app/data/service/remote_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void locatorSetup() {
  getIt.registerLazySingleton<APIService>(() => APIService());
  getIt.registerLazySingleton<CharactersRepos>(
      () => CharactersRepos(getIt.call()));
}

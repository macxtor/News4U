import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/news_repository_impl.dart';
import '../data/source/local_storage.dart';
import '../data/source/network_api.dart';
import '../domain/repository/news_repository.dart';
import '../domain/usecase/get_top_news_usecase.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  // Register your dependencies

  // Dio for NetworkApi
  getIt.registerLazySingleton<Dio>(() => Dio());

  // NetworkApi
  getIt.registerLazySingleton<NetworkApi>(() => NetworkApiImpl(dio: getIt<Dio>()));

  // LocalStorage
  getIt.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());

  // NewsRepository
  getIt.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(api: getIt<NetworkApi>(), localStorage: getIt<LocalStorage>()),
  );

  // GetTopNewsUseCase
  getIt.registerLazySingleton<GetTopNewsUseCase>(
    () => GetTopNewsUseCase(repository: getIt<NewsRepository>()),
  );
}

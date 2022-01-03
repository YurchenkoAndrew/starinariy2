import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starinariy2/core/platform/network_info.dart';
import 'package:starinariy2/features/home/data/local/data_sources/slide_local_data_source.dart';
import 'package:starinariy2/features/home/data/remote/data_sources/slide_remote_data_source.dart';
import 'package:starinariy2/features/home/data/repositories/slide_repository_impl.dart';
import 'package:starinariy2/features/home/domain/repositories/slide_repository.dart';
import 'package:starinariy2/features/home/domain/use_cases/get_slide.dart';
import 'package:starinariy2/features/home/presentation/manager/slide_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Block / Cubit
  sl.registerFactory(() => SlideCubit(getSlide: sl()));
  // Use Cases
  sl.registerLazySingleton(() => GetSlide(sl()));
  // Repository
  sl.registerLazySingleton<SlideRepository>(() => SlideRepositoryImpl(
      slideRemoteDataSource: sl(),
      slideLocalDataSource: sl(),
      networkInfo: sl()));
  sl.registerLazySingleton<SlideRemoteDataSource>(
      () => SlideRemoteDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<SlideLocalDataSource>(
      () => SlideLocalDataSourceImpl(sharedPreferences: sl()));
  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

import 'package:belajar_flutter/core/services/network/internet_info.dart';
import 'package:belajar_flutter/core/services/network/internet_info_imp.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void setupServices(GetIt getIt) {
  getIt.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  getIt.registerLazySingleton<InternetInfo>(() => InternetInfoImpl(checker: getIt()));
}

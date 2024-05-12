import 'package:belajar_flutter/domain/repositories/login_repository.dart';
import 'package:belajar_flutter/domain/repositories/poli_repository.dart';
import 'package:belajar_flutter/domain/usecase/login/login_usecase.dart';
import 'package:belajar_flutter/domain/usecase/login/logout_usecase.dart';
import 'package:belajar_flutter/domain/usecase/poli/delete_poli_usecase.dart';
import 'package:belajar_flutter/domain/usecase/poli/edit_poli_usecase.dart';
import 'package:belajar_flutter/domain/usecase/poli/get_poli_by_id_usecase.dart';
import 'package:belajar_flutter/domain/usecase/poli/get_poli_list_usecase.dart';
import 'package:belajar_flutter/domain/usecase/poli/save_poli_usecase.dart';
import 'package:get_it/get_it.dart';

void setupUseCases(GetIt getIt) {
  //LOGIN
  getIt.registerLazySingleton(() => LoginUseCase(loginRepository: getIt<LoginRepository>()));
  getIt.registerLazySingleton(() => LogoutUsecase(loginRepository: getIt<LoginRepository>()));
  //POLI
  getIt.registerLazySingleton<DeletePoliUseCase>(() => DeletePoliUseCase(repository: getIt<PoliRepository>()));
  getIt.registerLazySingleton<EditPoliUseCase>(() => EditPoliUseCase(repository: getIt<PoliRepository>()));
  getIt.registerLazySingleton<GetByIdPoliUseCase>(() => GetByIdPoliUseCase(repository: getIt<PoliRepository>()));
  getIt.registerLazySingleton<GetListPoliUseCase>(() => GetListPoliUseCase(repository: getIt<PoliRepository>()));
  getIt.registerLazySingleton<SavePoliUseCase>(() => SavePoliUseCase(repository: getIt<PoliRepository>()));
}

import 'package:belajar_1/domain/repositories/item_repository.dart';
import 'package:belajar_1/domain/repositories/login_repository.dart';
import 'package:belajar_1/domain/repositories/poli_repository.dart';
import 'package:belajar_1/domain/usecase/items/get_item_by_id_usecase.dart';
import 'package:belajar_1/domain/usecase/items/get_item_list_usecase.dart';
import 'package:belajar_1/domain/usecase/login/login_usecase.dart';
import 'package:belajar_1/domain/usecase/login/logout_usecase.dart';
import 'package:belajar_1/domain/usecase/poli/delete_poli_usecase.dart';
import 'package:belajar_1/domain/usecase/poli/edit_poli_usecase.dart';
import 'package:belajar_1/domain/usecase/poli/get_poli_by_id_usecase.dart';
import 'package:belajar_1/domain/usecase/poli/get_poli_list_usecase.dart';
import 'package:belajar_1/domain/usecase/poli/save_poli_usecase.dart';
import 'package:get_it/get_it.dart';

void setupUseCases(GetIt getIt) {
  //ITEM
  getIt.registerLazySingleton<GetItemListUseCase>(() => GetItemListUseCase(repository: getIt<ItemRepository>()));
  getIt.registerLazySingleton<GetItemByIdUseCase>(() => GetItemByIdUseCase(repository: getIt<ItemRepository>()));
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

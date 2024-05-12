import 'package:belajar_flutter/common/services/network/internet_info.dart';
import 'package:belajar_flutter/data/repositories/login_repository_impl.dart';
import 'package:belajar_flutter/data/repositories/pegawai_repository_impl.dart';
import 'package:belajar_flutter/data/repositories/poli_repository_impl.dart';
import 'package:belajar_flutter/data/sources/local/user_local_source.dart';
import 'package:belajar_flutter/data/sources/server/pegawai_source_impl.dart';
import 'package:belajar_flutter/data/sources/server/poli_source_impl.dart';
import 'package:belajar_flutter/domain/repositories/login_repository.dart';
import 'package:belajar_flutter/domain/repositories/pegawai_repository.dart';
import 'package:belajar_flutter/domain/repositories/poli_repository.dart';
import 'package:get_it/get_it.dart';

void setupRepositories(GetIt getIt) {
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
        userLocalSource: getIt<UserLocalSource>(),
      ));
  getIt.registerLazySingleton<PoliRepository>(() => PoliRepositoryImpl(
        poliSource: getIt<PoliSource>(),
        internetInfo: getIt<InternetInfo>(),
      ));
  getIt.registerLazySingleton<PegawaiRepository>(() => PegawaiRepositoryImpl(
        poliSource: getIt<PegawaiSource>(),
        internetInfo: getIt<InternetInfo>(),
      ));
}

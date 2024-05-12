import 'package:belajar_flutter/data/sources/api/api_client.dart';
import 'package:belajar_flutter/data/sources/local/user_local_source.dart';
import 'package:belajar_flutter/data/sources/local/user_local_source_impl.dart';
import 'package:belajar_flutter/data/sources/server/pegawai_source_impl.dart';
import 'package:belajar_flutter/data/sources/server/poli_source_impl.dart';
import 'package:get_it/get_it.dart';

void setupSources(GetIt getIt) {
  getIt.registerLazySingleton<UserLocalSource>(() => UserLocalSourceImpl());
  getIt.registerLazySingleton<PoliSource>(() => PoliSourceImpl(client: ApiClient()));
  getIt.registerLazySingleton<PegawaiSource>(() => PegawaiSourceImpl(client: ApiClient()));
}

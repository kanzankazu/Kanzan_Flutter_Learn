import 'package:belajar_flutter/data/sources/api/api_client.dart';
import 'package:belajar_flutter/data/sources/local/local_source.dart';
import 'package:belajar_flutter/data/sources/local/local_source_imp.dart';
import 'package:belajar_flutter/data/sources/local/user_local_source.dart';
import 'package:belajar_flutter/data/sources/local/user_local_source_impl.dart';
import 'package:belajar_flutter/data/sources/server/item_source_imp.dart';
import 'package:belajar_flutter/data/sources/server/pasien_source_impl.dart';
import 'package:belajar_flutter/data/sources/server/pegawai_source_impl.dart';
import 'package:belajar_flutter/data/sources/server/poli_source_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

void setupSources(GetIt getIt) {
  getIt.registerLazySingleton<LocalSource>(() => LocalSourceImp());
  getIt.registerLazySingleton<UserLocalSource>(() => UserLocalSourceImpl());
  getIt.registerLazySingleton<ItemSource>(() => ItemSourceImp(client: Client()));
  getIt.registerLazySingleton<PoliSource>(() => PoliSourceImpl(client: ApiClient()));
  getIt.registerLazySingleton<PegawaiSource>(() => PegawaiSourceImpl(client: ApiClient()));
  getIt.registerLazySingleton<PasienSource>(() => PasienSourceImpl(client: ApiClient()));
}

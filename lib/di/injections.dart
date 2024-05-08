import 'package:belajar_1/di/injections_blocs.dart';
import 'package:belajar_1/di/injections_repositories.dart';
import 'package:belajar_1/di/injections_services.dart';
import 'package:belajar_1/di/injections_sources.dart';
import 'package:belajar_1/di/injections_usecases.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  setupBlocs(getIt);
  setupRepositories(getIt);
  setupServices(getIt);
  setupSources(getIt);
  setupUseCases(getIt);
}

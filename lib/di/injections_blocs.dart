import 'package:belajar_flutter/presentation/bloc/login/login_logout_bloc.dart';
import 'package:belajar_flutter/presentation/bloc/poli/poli_bloc.dart';
import 'package:get_it/get_it.dart';

void setupBlocs(GetIt getIt) {
  getIt.registerFactory<PoliBloc>(() => PoliBloc(
        deletePoliUseCase: getIt(),
        editPoliUseCase: getIt(),
        getByIdPoliUseCase: getIt(),
        getListPoliUseCase: getIt(),
        savePoliUseCase: getIt(),
      ));
  getIt.registerFactory<LoginLogoutBloc>(() => LoginLogoutBloc(
        loginUseCase: getIt(),
        logoutUsecase: getIt(),
      ));
}

import 'dart:async';

import 'package:belajar_flutter/core/error/failure.dart';
import 'package:belajar_flutter/core/utils/generics/bloc_status.dart';
import 'package:belajar_flutter/core/utils/generics/no_input.dart';
import 'package:belajar_flutter/domain/entities/request/login_request.dart';
import 'package:belajar_flutter/domain/usecase/login/login_usecase.dart';
import 'package:belajar_flutter/domain/usecase/login/logout_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_logout_bloc_event.dart';
part 'login_logout_bloc_state.dart';

class LoginLogoutBloc extends Bloc<LoginLogoutBlocEvent, LoginLogoutBlocState> {
  LoginLogoutBloc({
    required this.loginUseCase,
    required this.logoutUsecase,
  }) : super(const LoginLogoutBlocState(status: Status.empty)) {
    on<OnLogin>(onLogin);
    on<OnLogout>(onLogout);
  }

  final LoginUseCase loginUseCase;
  final LogoutUsecase logoutUsecase;

  Future<void> onLogin(OnLogin event, Emitter<LoginLogoutBlocState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await loginUseCase(event.loginRequest);

    if (result.isSuccess()) {
      emit(state.copyWith(status: Status.loaded, returnLogin: result.getSuccess()));
    } else {
      if (result.getError() is ServerFailure) {
        emit(state.copyWith(status: Status.serverError));
      } else if (result.getError() is NotConnectedFailure) {
        emit(state.copyWith(status: Status.networkError));
      }
    }
  }

  Future<void> onLogout(OnLogout event, Emitter<LoginLogoutBlocState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await logoutUsecase(NoInput());

    if (result.isSuccess()) {
      emit(state.copyWith(status: Status.loaded, returnLogout: result.getSuccess()));
    } else {
      if (result.getError() is ServerFailure) {
        emit(state.copyWith(status: Status.serverError));
      } else if (result.getError() is NotConnectedFailure) {
        emit(state.copyWith(status: Status.networkError));
      }
    }
  }
}

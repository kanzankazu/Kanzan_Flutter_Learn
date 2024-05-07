part of 'login_logout_bloc.dart';

abstract class LoginLogoutBlocEvent extends Equatable {
  const LoginLogoutBlocEvent();

  @override
  List<Object> get props => [];
}

class OnLogin extends LoginLogoutBlocEvent {
  const OnLogin({required this.loginRequest});

  final LoginRequest loginRequest;
}

class OnLogout extends LoginLogoutBlocEvent {}

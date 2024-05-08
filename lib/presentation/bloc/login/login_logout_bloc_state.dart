part of 'login_logout_bloc.dart';

class LoginLogoutBlocState extends Equatable {
  const LoginLogoutBlocState({
    required this.status,
    this.returnLogin,
    this.returnLogout,
  });

  final Status status;
  final (bool, String)? returnLogin;
  final bool? returnLogout;

  @override
  List<Object?> get props => [status, returnLogin];

  LoginLogoutBlocState copyWith({
    Status? status,
    (bool, String)? returnLogin,
    bool? returnLogout,
  }) {
    return LoginLogoutBlocState(
      status: status ?? this.status,
      returnLogin: returnLogin ?? this.returnLogin,
      returnLogout: returnLogout ?? this.returnLogout,
    );
  }
}

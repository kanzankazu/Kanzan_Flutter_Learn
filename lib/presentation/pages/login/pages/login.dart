import 'package:belajar_flutter/core/utils/generics/bloc_status.dart';
import 'package:belajar_1/di/injections.dart';
import 'package:belajar_1/domain/entities/request/login_request.dart';
import 'package:belajar_1/presentation/bloc/login/login_logout_bloc.dart';
import 'package:belajar_1/presentation/pages/home/beranda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login Admin",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Column(
                      children: [
                        _usernameTextField(),
                        const SizedBox(height: 20),
                        _passwordTextField(),
                        const SizedBox(height: 40),
                        _tombolLogin(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget _usernameTextField() {
    return TextFormField(
      decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Username"),
      controller: _usernameCtrl,
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Password"),
      obscureText: true,
      controller: _passwordCtrl,
    );
  }

  Widget _tombolLogin() {
    return BlocProvider(
      create: (context) => getIt<LoginLogoutBloc>(),
      child: BlocConsumer<LoginLogoutBloc, LoginLogoutBlocState>(
        listener: (context, state) {
          if (state.status == Status.serverError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text("Server Error"),
              ),
            );
          }
          if (state.status == Status.networkError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text("Not connected "),
              ),
            );
          }
          if (state.status == Status.loaded) {
            if (state.returnLogin != null) {
              var value = state.returnLogin;
              if (value?.$1 == true) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Beranda()));
              } else {
                AlertDialog alertDialog = AlertDialog(
                  content: Text(value!.$2),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: const Text("OK"),
                    )
                  ],
                );
                showDialog(context: context, builder: (context) => alertDialog);
              }
            }
          }
        },
        builder: (context, state) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                child: const Text("Login"),
                onPressed: () async {
                  String username = _usernameCtrl.text;
                  String password = _passwordCtrl.text;
                  var loginRequest = LoginRequest(username: username, password: password);
                  context.read<LoginLogoutBloc>().add(OnLogin(loginRequest: loginRequest));
                }),
          );
        },
      ),
    );
  }
}

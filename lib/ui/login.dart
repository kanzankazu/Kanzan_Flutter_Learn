// ignore_for_file: prefer_const_constructors

import 'package:belajar_1/helper/poli_service.dart';
import 'package:belajar_1/ui/beranda.dart';
import 'package:flutter/material.dart';

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
              Text("Login Admin",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
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
                        SizedBox(height: 20),
                        _passwordTextField(),
                        SizedBox(height: 40),
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
      decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Username"),
      controller: _usernameCtrl,
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Password"),
      obscureText: true,
      controller: _passwordCtrl,
    );
  }

  Widget _tombolLogin() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          child: Text("Login"),
          onPressed: () async {
            String username = _usernameCtrl.text;
            String password = _passwordCtrl.text;
            await LoginService().login(username, password).then((value) {
              if (value == true) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Beranda()));
              } else {
                AlertDialog alertDialog = AlertDialog(
                  content: const Text("Username atau Password Tidak Valid"),
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
            });
          }),
    );
  }
}

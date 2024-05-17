import 'package:belajar_flutter/presentation/pages/home/home.dart';
import 'package:belajar_flutter/presentation/pages/login/pages/login.dart';
import 'package:belajar_flutter/presentation/pages/widget/not_found_page.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static String home = "/home";
  static String detail = "/detail";
  static String login = "/login";
  static String notFound = "/notFound";
}

abstract class AppRoute {
  static String initial = Routes.home;
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.home: (context) => const Home(),
    Routes.login: (context) => const Login(),
    Routes.notFound: (context) => const NotFound(),
  };
}

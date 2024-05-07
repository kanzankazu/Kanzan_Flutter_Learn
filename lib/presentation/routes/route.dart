import 'package:belajar_1/presentation/pages/detail/pages/detail_page.dart';
import 'package:belajar_1/presentation/pages/home/pages/home_page.dart';
import 'package:belajar_1/presentation/pages/login/pages/login.dart';
import 'package:belajar_1/presentation/pages/notfound/not_found_page.dart';
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
    Routes.home: (context) => const HomePage(),
    Routes.detail: (context) => const DetailPage(),
    Routes.login: (context) => const Login(),
    Routes.notFound: (context) => const NotFound(),
  };
}

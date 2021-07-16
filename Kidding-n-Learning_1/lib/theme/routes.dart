import 'package:flutter/material.dart';
import 'package:quiz_covid19/pages/login_page.dart';
import 'package:quiz_covid19/pages/register_page.dart';
import 'package:quiz_covid19/pages/menu.dart';

class AppRoutes {
  AppRoutes._();

  static const String authLogin = '/auth-login';
  static const String authRegister = '/auth-register';
  static const String menu = '/menu';

  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => Login(),
      authRegister: (context) => Register(),
      menu: (context) => MenuPage()
    };
  }
}

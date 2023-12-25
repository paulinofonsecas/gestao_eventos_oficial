import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/home/view/home_page.dart';
import 'package:gestao_eventos/presentation/login/view/sign_in_page.dart';

class GlobalRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (context) => const SignInPage());
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return null;
    }
  }
}

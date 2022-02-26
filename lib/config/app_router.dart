import 'package:breaking_bad_app/view/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    dynamic args;
    if (settings.arguments != null) args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("no Views for that root")),
          );
        });
    }
  }
}

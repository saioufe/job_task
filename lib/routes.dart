import 'package:flutter/cupertino.dart';
import 'package:job_task/routes/home_screen.dart';
import 'package:job_task/routes/work_screen.dart';

class RouteGenerator {
  static const String homePage = "/";
  static const String workPage = "/work";
  static final key = GlobalKey<NavigatorState>();
  const RouteGenerator();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      case workPage:
        return CupertinoPageRoute(builder: (_) => const WorkScreen());

      default:
        throw FormatException();
    }
  }
}

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}

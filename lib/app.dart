import 'package:flutter/material.dart';
import 'package:rocket_apps_flutter/routes.dart';

class App extends StatelessWidget {
  static const String title = "Engage to Help";

  // ignore: non_constant_identifier_names
  static String? PackageName;

  static double width = 376;

  static RouteObserver<PageRoute>? routeObserver;

  // static SessionManager sessionManager = SessionManager();
  // static LocalStorage localStorage = LocalStorage();

  // static Enviroment? enviroment;

  App() {
    routeObserver = RouteObserver<PageRoute>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      routes: Routes.all,
      navigatorObservers: [routeObserver!],
    );
  }
}

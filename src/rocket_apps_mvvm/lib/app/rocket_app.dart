import 'package:flutter/material.dart';

class RocketApp extends StatelessWidget {
  static const String title = "Engage to Help";

  // ignore: non_constant_identifier_names
  static late String PackageName;

  //static double width = 376;

  static RouteObserver<PageRoute>? routeObserver;

  //static SessionManager sessionManager = SessionManager();
  //static LocalStorage localStorage = LocalStorage();

  static late String enviroment;

  static late String initialRoute;
  static late Map<String, WidgetBuilder> routes;

  RocketApp() {
    routeObserver = RouteObserver<PageRoute>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      routes: routes,
      navigatorObservers: [routeObserver!],
    );
  }
}

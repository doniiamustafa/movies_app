import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movies_app/config/app_routes.dart';
import 'package:movies_app/config/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await initLaunching();
  runApp(MovieApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MovieApp extends StatelessWidget {
  MovieApp({super.key});
  final AppRoutes appRouter = AppRoutes();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoutes,
    );
  }
}

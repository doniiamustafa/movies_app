import 'package:flutter/material.dart';
import 'package:movies_app/config/app_routes.dart';

void main() {
  runApp(MovieApp());
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

import 'package:flutter/material.dart';
import 'package:gemini_demo/core/routing/router.dart';
import 'package:gemini_demo/core/routing/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: Routes.chatScreen,
      onGenerateRoute: PageRoutes.generateRoutes,
    );
  }
}
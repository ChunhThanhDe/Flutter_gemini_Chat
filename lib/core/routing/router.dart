import 'package:flutter/material.dart';
import 'package:gemini_demo/core/constants/string_constant.dart';
import 'package:gemini_demo/core/routing/routes.dart';
import 'package:gemini_demo/ui/views/chat_screen.dart';

class PageRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.chatScreen:
        return MaterialPageRoute(builder: (context) => ChatScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => const Text(StringConstants.noPageExists));
    }
  }
}

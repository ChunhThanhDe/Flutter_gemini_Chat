import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini_demo/core/di/locator.dart';
import 'package:gemini_demo/ui/views/my_app.dart';

void main() {
  setUpLocator();
  Gemini.init(
    apiKey: "Your-API-Key",
  );
  runApp(const MyApp());
}




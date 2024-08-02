import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini_demo/core/di/locator.dart';
import 'package:gemini_demo/ui/views/my_app.dart';

void main() {
  setUpLocator();
  Gemini.init(
    apiKey: "AIzaSyBGYUXHZrK3jt-liVRNhCIrtcTB9QgA8O8",
  );
  runApp(const MyApp());
}




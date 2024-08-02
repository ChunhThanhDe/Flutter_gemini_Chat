import 'dart:io';

import 'package:gemini_demo/core/enums/roles.dart';

class ChatModel {
  String text;
  File? image;
  Roles role;

  ChatModel({
    required this.text,
    required this.role,
    this.image,
  });
}

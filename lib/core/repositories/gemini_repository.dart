import 'dart:developer';
import 'dart:io';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini_demo/core/constants/string_constant.dart';

class GeminiRepository {
  late Gemini _gemini;
  static final GeminiRepository _instance = GeminiRepository._internal();
  factory GeminiRepository() {
    return _instance;
  }
  GeminiRepository._internal() {
    _gemini = Gemini.instance;
    _response = reponse;
  }

  String? _response;
  String? get reponse => _response;
  void setResponse(String? value) {
    _response = value;
  }

  Future<String> sendText(String text) async {
    String val = await _gemini.text(text).then((value) {
      log("Parts>>>>>>>>>${value?.content?.parts}");
      log("Roles>>>>>>>>>${value?.content?.role}");
      setResponse(value?.output ?? "");
      if (value?.finishReason != 'STOP') {
        setResponse(value?.output ?? StringConstants.invalidQuery);
      }
      return _response ?? "";
    }).catchError((e) => "$e");
    log(val);
    return val;
  }

  Future<String> sendTextAndImage(String text, File imageFile) async {
    String val = await _gemini.textAndImage(
      text: text,
      images: [imageFile.readAsBytesSync()],
    ).then((value) {
      log(value?.content?.parts?.last.text ?? '');
      log("Roles>>>>>>>>>${value?.content?.role}");
      setResponse(_response = value?.content?.parts?.last.text ?? '');
      if (value?.finishReason != 'STOP') {
        setResponse(StringConstants.invalidQuery);
      }
      return value?.content?.parts?.last.text ?? '';
    }).catchError((e) => "$e");
    return val;
  }
}

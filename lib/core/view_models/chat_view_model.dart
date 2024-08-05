import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gemini_demo/core/enums/roles.dart';
import 'package:gemini_demo/core/models/chat_model.dart';
import 'package:gemini_demo/core/repositories/gemini_repository.dart';
import 'package:gemini_demo/core/view_models/base_model.dart';
import 'package:image_picker/image_picker.dart';

class ChatViewModel extends BaseModel {
  final GeminiRepository apiRepository = GeminiRepository();
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  late List<ChatModel> _messages;
  File? _imageFile;
  bool? _showEmoji;
  int? _modelResponseIndex;

  List<ChatModel> get messages => _messages;

  set messages(List<ChatModel> value) {
    _messages = value;
    updateUI();
  }

  File? get imageFile => _imageFile;

  set imageFile(File? value) {
    _imageFile = value;
    updateUI();
  }

  bool? get showEmoji => _showEmoji;

  set setShowEmoji(bool? value) {
    _showEmoji = value;
    updateUI();
  }

  int? get modelResponseIndex => _modelResponseIndex;

  set modelResponseIndex(int? value) {
    _modelResponseIndex = value;
    updateUI();
  }

  ChatViewModel() {
    _messages = [];
  }

  Future<void> getTextAndImageInfo() async {
    File? sendFile;
    sendFile = imageFile;
    messages.add(ChatModel(
      text: messageController.text,
      role: Roles.user,
      image: sendFile,
    ));
    imageFile = null;

    messages.add(ChatModel(
      role: Roles.model,
      text: "",
    ));
    modelResponseIndex = messages.length;
    scrollMessages();
    updateUI();
    String response = sendFile != null ? await apiRepository.sendTextAndImage(messageController.text, sendFile) : await apiRepository.sendText(messageController.text);
    messages.removeAt(messages.length - 1);
    messages.add(ChatModel(
      role: Roles.model,
      text: response,
    ));
    scrollMessages();
    updateUI();
  }

  scrollMessages() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 120,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeOut,
    );
  }

  pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);

        updateUI();
        return imageFile;
      } else {
        log('User didnt pick any image.');
      }
      imageFile = null;
    } catch (e) {
      log(e.toString());
    }
  }
}

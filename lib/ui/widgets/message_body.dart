import 'package:flutter/material.dart';
import 'package:gemini_demo/core/constants/color_consant.dart';
import 'package:gemini_demo/core/models/chat_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({
    super.key,
    required this.isLoading,
    required this.message,
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
  });

  final bool isLoading;
  final ChatModel message;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.grey7A8194,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
        ),
      ),
      child: isLoading == true
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: LoadingAnimationWidget.waveDots(
                color: ColorConstants.white,
                size: 15,
              ),
            )
          : Text(
              message.text,
              style: const TextStyle(
                color: ColorConstants.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
    );
  }
}

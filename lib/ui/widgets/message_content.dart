import 'package:flutter/material.dart';
import 'package:gemini_demo/core/constants/color_consant.dart';
import 'package:gemini_demo/core/enums/roles.dart';
import 'package:gemini_demo/core/models/chat_model.dart';
import 'package:gemini_demo/ui/widgets/message_body.dart';

class MessageContent extends StatelessWidget {
  const MessageContent(
      {super.key,
      required this.message,
      required this.index,
      required this.lastIndex});
  final ChatModel message;
  final int index;
  final int lastIndex;
  @override
  Widget build(BuildContext context) {
    final isLoading = index + 1 == lastIndex &&
        message.role == Roles.model &&
        message.text.isEmpty;
    final isUser = message.role == Roles.user;
    return Padding(
      padding: EdgeInsets.only(
          bottom: 10.0, right: isUser ? 20.0 : 60.0, left: isUser ? 60 : 20),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: message.image != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MessageBody(
                          isLoading: isLoading,
                          message: message,
                          topLeft: 20,
                          topRight: 20,
                          bottomLeft: 20,
                          bottomRight: 0),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          color: ColorConstants.grey7A8194,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: message.image != null
                            ? ClipRRect(
                                child: Image(
                                  height: 200,
                                  image: FileImage(message.image!),
                                  fit: BoxFit.fill,
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ],
                  )
                : isUser
                    ? MessageBody(
                        isLoading: isLoading,
                        message: message,
                        topLeft: 20,
                        topRight: 20,
                        bottomLeft: 20,
                        bottomRight: 0)
                    : MessageBody(
                        isLoading: isLoading,
                        message: message,
                        topLeft: 20,
                        topRight: 20,
                        bottomLeft: 0,
                        bottomRight: 20),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gemini_demo/core/constants/color_consant.dart';
import 'package:gemini_demo/core/constants/image_constants.dart';
import 'package:gemini_demo/core/constants/string_constant.dart';
import 'package:gemini_demo/core/models/chat_model.dart';
import 'package:gemini_demo/core/view_models/chat_view_model.dart';
import 'package:gemini_demo/ui/views/base_view.dart';
import 'package:gemini_demo/ui/widgets/emoji_picker.dart';
import 'package:gemini_demo/ui/widgets/input_field.dart';
import 'package:gemini_demo/ui/widgets/message_content.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  ChatViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<ChatViewModel>(
      onModelReady: (model) {
        this.model = model;
      },
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            model.setShowEmoji = false;
          },
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.defaultWallpaper),
              ),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: ColorConstants.transparent,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 80),
                child: buildAppBar(context),
              ),
              body: buildBody(context),
            ),
          ),
        );
      },
    );
  }

  Widget buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 40, bottom: 20),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(ImageConstants.logo, fit: BoxFit.fill),
        ),
        title: const Text(
          StringConstants.geminiDemo,
          style: TextStyle(color: ColorConstants.white, fontSize: 20),
        ),
        trailing: IconButton(
          onPressed: () async {
            const url = 'https://www.linkedin.com/in/chunhthanhde/';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          icon: const Icon(
            Icons.link,
            color: ColorConstants.white,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget buildBody(context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: model?.scrollController,
            itemCount: model?.messages.length,
            itemBuilder: (context, index) {
              ChatModel? chatModel;
              int lastIndex = (model?.messages.length ?? 0);
              if (model?.messages != null) {
                chatModel = model?.messages[index];
              }
              return chatModel != null ? MessageContent(message: chatModel, index: index, lastIndex: lastIndex) : Container();
            },
          ),
        ),
        InputFieldWidget(
          model: model,
        ),
        if (model?.showEmoji == true)
          SizedBox(
            height: MediaQuery.of(context).size.height * .35,
            child: EmojiPickerWidget(controller: model?.messageController ?? TextEditingController()),
          ),
      ],
    );
  }
}

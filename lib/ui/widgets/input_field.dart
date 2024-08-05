import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gemini_demo/core/constants/color_consant.dart';
import 'package:gemini_demo/core/constants/image_constants.dart';
import 'package:gemini_demo/core/view_models/chat_view_model.dart';
import 'package:gemini_demo/ui/widgets/common_input_field_buttons.dart';
import 'package:gemini_demo/ui/widgets/common_text_form_field.dart';
import 'package:gemini_demo/ui/widgets/pop_up_menu.dart';

class InputFieldWidget extends StatefulWidget {
  const InputFieldWidget({super.key, this.model});

  final ChatViewModel? model;

  @override
  _InputFieldWidgetState createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  bool canPop = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: (bool value) {
        if (widget.model?.showEmoji == false) {
          setState(() {
            canPop = !value;
          });

          if (canPop) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Click once more to go back"),
                duration: Duration(milliseconds: 1500),
              ),
            );
          }
        } else {
          FocusScope.of(context).unfocus();
          setState(() {
            widget.model?.setShowEmoji = false;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15, top: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: ColorConstants.grey3D4354,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.model?.imageFile != null
                        ? Container(
                            padding: const EdgeInsets.only(left: 22),
                            child: TextFormFieldWidget(
                              model: widget.model,
                            ),
                          )
                        : const SizedBox(),
                    widget.model?.imageFile != null
                        ? Container(
                            padding: const EdgeInsets.only(top: 5),
                            child: Image(
                              height: 200,
                              width: 200,
                              image: FileImage(widget.model?.imageFile ?? File(ImageConstants.demo)),
                            ),
                          )
                        : const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InputFieldButton(
                          icon: Icons.emoji_emotions,
                          onpressed: () {
                            FocusScope.of(context).unfocus();
                            widget.model?.setShowEmoji = true;
                          },
                        ),
                        widget.model?.imageFile == null
                            ? Flexible(
                                child: TextFormFieldWidget(
                                model: widget.model,
                              ))
                            : const SizedBox(),
                        InputFieldButton(
                          icon: Icons.attach_file,
                          onpressed: () {
                            widget.model?.setShowEmoji = false;
                            showModalBottomSheet(
                                backgroundColor: ColorConstants.transparent,
                                context: context,
                                isScrollControlled: true,
                                builder: (builder) => Padding(
                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                    child: PopUpWidget(
                                      model: widget.model,
                                    )));
                          },
                        ),
                        InputFieldButton(
                          icon: Icons.send,
                          onpressed: () {
                            if (widget.model?.imageFile != null && widget.model!.messageController.text.toString().isEmpty) {
                              widget.model?.getTextAndImageInfo();
                            }
                            if (widget.model?.messageController.text.toString().isNotEmpty ?? false) {
                              widget.model?.getTextAndImageInfo();
                              widget.model?.messageController.clear();
                            }
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

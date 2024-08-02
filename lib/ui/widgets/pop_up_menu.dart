import 'package:flutter/material.dart';
import 'package:gemini_demo/core/constants/color_consant.dart';
import 'package:gemini_demo/core/constants/string_constant.dart';
import 'package:gemini_demo/core/view_models/chat_view_model.dart';
import 'package:gemini_demo/ui/widgets/common_pop_up_item.dart';
import 'package:image_picker/image_picker.dart';

class PopUpWidget extends StatelessWidget {
  const PopUpWidget({super.key, required this.model});
  final ChatViewModel? model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 70),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: ColorConstants.grey373E4E,
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PopUpItem(
                icon: Icons.photo_library_rounded,
                text: StringConstants.gallery,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  model?.pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                firstIconBackgroundColor: ColorConstants.blueAccent,
                secondIconBackgroundColor: ColorConstants.blue,
              ),
              const SizedBox(
                width: 50,
              ),
              PopUpItem(
                icon: Icons.camera_alt,
                text: StringConstants.camera,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  model?.pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                firstIconBackgroundColor: ColorConstants.pink,
                secondIconBackgroundColor: ColorConstants.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

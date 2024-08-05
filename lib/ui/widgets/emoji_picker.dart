import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

class EmojiPickerWidget extends StatelessWidget {
  const EmojiPickerWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return EmojiPicker(
      textEditingController: controller,
      config: Config(
        height: 256,
        checkPlatformCompatibility: true,
        emojiViewConfig: EmojiViewConfig(
          emojiSizeMax: 28 * (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.20 : 1.0),
          backgroundColor: Colors.black, // Background color for emoji view
        ),
        swapCategoryAndBottomBar: false,
        skinToneConfig: const SkinToneConfig(
          enabled: true,
          indicatorColor: Colors.white,
          dialogBackgroundColor: Colors.black, // Background color for skin tone selector
        ),
        categoryViewConfig: const CategoryViewConfig(
          backgroundColor: Colors.black, // Background color for category view
          iconColor: Colors.white, // Icon color for category icons
          iconColorSelected: Colors.blue, // Color for selected category icon
        ),
        bottomActionBarConfig: const BottomActionBarConfig(
          backgroundColor: Colors.black, // Background color for bottom action bar
          buttonIconColor: Colors.white, // Icon color for bottom action bar icons
        ),
        searchViewConfig: const SearchViewConfig(
          backgroundColor: Colors.black, // Background color for search view
          buttonIconColor: Colors.white, // Icon color for search view icons
          buttonColor: Colors.white, // Text color for search input
        ),
      ),
    );
  }
}

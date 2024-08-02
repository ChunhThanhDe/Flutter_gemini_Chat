import 'package:flutter/material.dart';
import 'package:gemini_demo/core/constants/color_consant.dart';

class PopUpItem extends StatelessWidget {
  const PopUpItem(
      {super.key,
      required this.icon,
      required this.text,
      required this.onTap,
      required this.firstIconBackgroundColor,
       required this.secondIconBackgroundColor,
      });
  final IconData icon;
  final String text;
  final Function onTap;
  final Color firstIconBackgroundColor;
    final Color secondIconBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        onTap();
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors:[firstIconBackgroundColor,secondIconBackgroundColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: ColorConstants.white54,
              child: Icon(icon, color: ColorConstants.white),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(text,
              style: const TextStyle(
                color: ColorConstants.white,
              )),
        ],
      ),
    );
  }
}

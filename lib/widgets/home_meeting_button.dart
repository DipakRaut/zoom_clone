import "package:flutter/material.dart";
import 'package:zoom_clone/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onTappedPressed;
  final IconData iconName;

  final String text;

  const HomeMeetingButton(
      {Key? key,
      required this.onTappedPressed,
      required this.text,
      required this.iconName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTappedPressed,
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.06),
                    offset: const Offset(0, 4))
              ]),
          height: 60,
          width: 60,
          child: Icon(
            iconName,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 10),
        Text(text, style: const TextStyle(color: Colors.grey))
      ]),
    );
  }
}

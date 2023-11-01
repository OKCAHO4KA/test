import 'package:flutter/material.dart';

class ButtonColor extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? colorButton;
  final double? minWidthButton;
  final double? heigthButton;
  final Color? colorText;
  final double? radius;
  final double? fontSize;

  const ButtonColor({
    super.key,
    required this.text,
    required this.onPressed,
    this.colorButton = Colors.grey,
    this.minWidthButton = 160,
    this.heigthButton = 35,
    this.colorText = Colors.white,
    this.radius = 36,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
          splashColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius!)),
          color: colorButton!,
          minWidth: minWidthButton,
          height: heigthButton,
          onPressed: () => onPressed!(),
          child: Text(text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                color: colorText,
              ))),
    );
  }
}

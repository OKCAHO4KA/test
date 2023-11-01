import 'package:flutter/material.dart';
import 'package:reto/confiig/theme/app_theme.dart';
import 'package:reto/presentation/widgets/button_color.dart';

class ButtonsPart extends StatefulWidget {
  const ButtonsPart({
    super.key,
    required this.title,
    required this.onPressed,
    required this.onPressed2,
    required this.isPressed,
  });

  final String title;
  final void Function() onPressed;
  final void Function() onPressed2;
  final bool isPressed;

  @override
  State<ButtonsPart> createState() => _ButtonsPartState();
}

class _ButtonsPartState extends State<ButtonsPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ButtonColor(
                      text: 'Add address',
                      onPressed: widget.onPressed,
                      colorButton:
                          widget.isPressed ? AppTheme.orange : AppTheme.gray5,
                      colorText:
                          widget.isPressed ? Colors.white : AppTheme.gray2),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ButtonColor(
                    text: 'Select address',
                    onPressed: widget.onPressed2,
                    colorButton:
                        !widget.isPressed ? AppTheme.orange : AppTheme.gray5,
                    colorText:
                        !widget.isPressed ? Colors.white : AppTheme.gray2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

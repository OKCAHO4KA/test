import 'package:flutter/material.dart';
import 'package:reto/confiig/theme/app_theme.dart';
import 'package:reto/presentation/widgets/custom_input.dart';

class ItemTextFormField extends StatelessWidget {
  const ItemTextFormField({
    super.key,
    required this.title,
    this.onChanged,
    this.prefixIcon,
    this.icon,
    this.label = '',
    this.typeKeyboard = TextInputType.text,
    this.validator,
  });

  final String title;
  final String? label;
  final dynamic Function(String)? onChanged;
  final Widget? prefixIcon;
  final IconData? icon;
  final TextInputType? typeKeyboard;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(title, style: Theme.of(context).textTheme.titleSmall),
        ),
        CustomTextFormField(
          validator: validator,
          typeKeyboard: typeKeyboard,
          label: label,
          onChanged: (value) {
            onChanged!(value);
          },
          prefixIcon:
              prefixIcon ?? Icon(icon, size: 25, color: AppTheme.grayDark),
        ),
      ],
    );
  }
}

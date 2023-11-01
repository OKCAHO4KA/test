import 'package:flutter/material.dart';
import 'package:reto/confiig/theme/app_theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMensage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextInputType? typeKeyboard;
  final Color? colorIcon;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMensage,
      this.onChanged,
      this.validator,
      this.prefixIcon,
      this.colorIcon,
      this.typeKeyboard = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppTheme.gray, width: 0.5));
    return TextFormField(
      keyboardType: typeKeyboard,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: colorIcon,
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.red, width: 0.5)),
          focusedErrorBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.red, width: 0.5)),
          isDense: true,
          label: Text(label ?? ''),
          hintText: hint,
          hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppTheme.grayDark,
              fontFamily: 'Roboto'),

          // icon: const Icon(Icons.person),
          // prefixIcon: const Icon(Icons.person),
          // suffixIcon: const Icon(Icons.person),
          errorText: errorMensage),
    );
  }
}

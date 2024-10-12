import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.onEditingComplete,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? hintText;
  final IconData? prefixIcon;
  final VoidCallback? onEditingComplete;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.body4.copyWith(color: AppColors.gray),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: AppColors.gray,
                size: 15,
              )
            : null,
        border: const UnderlineInputBorder(),
        isDense: true,
        prefixIconConstraints: const BoxConstraints.tightFor(height: 15),
      ),
    );
  }
}

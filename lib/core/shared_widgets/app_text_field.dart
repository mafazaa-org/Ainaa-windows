import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.textStyle,
    this.controller,
    this.hintText,
    this.errorText,
    this.keyboardType = TextInputType.text,
    required this.onChanged,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.inputFormatters,
    this.enableInteractiveSelection = true,
    this.autofillHints,
  });
  final String label;
  final TextStyle? textStyle;
  final String? hintText;
  final String? errorText;
  final TextInputType keyboardType;
  final void Function(String) onChanged;
  final Widget? suffixIcon;
  final TextInputAction textInputAction;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final bool enableInteractiveSelection;
  final Iterable<String>? autofillHints;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.sm,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textStyle ?? context.textStyles.bodyLarge),
        TextField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          style: context.textStyles.bodyMedium,
          obscuringCharacter: '•',
          obscureText: obscureText,
          autocorrect: false,
          enableSuggestions: false,
          autofillHints: autofillHints,
          enableInteractiveSelection: enableInteractiveSelection,
          inputFormatters: inputFormatters,
          decoration: _inputDecoration(
            context,
            errorText: errorText,
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(
    BuildContext context, {
    required String? errorText,
    required String? hintText,
    required Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      errorText: errorText,
      hintStyle: context.textStyles.bodySmall.copyWith(
        color: context.theme.hintColor,
      ),
      suffixIcon: suffixIcon,
    );
  }
}

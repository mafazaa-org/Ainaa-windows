import 'package:ainaa/config/extensions/context_extension.dart';
import 'package:ainaa/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.label,
    this.textStyle,
    this.controller,
    this.hintText,
    this.initialValue,
    this.errorText,
    this.keyboardType = TextInputType.text,
    required this.onChanged,
    this.validator,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.inputFormatters,
    this.enableInteractiveSelection = true,
    this.autovalidateMode = AutovalidateMode.onUnfocus,
    this.autofillHints,
    this.onFieldSubmitted,
    this.maxLines = 1,
  });
  final String label;
  final TextStyle? textStyle;
  final String? hintText;
  final String? initialValue;
  final String? errorText;
  final TextInputType keyboardType;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextInputAction textInputAction;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final bool enableInteractiveSelection;
  final AutovalidateMode autovalidateMode;
  final Iterable<String>? autofillHints;
  final void Function(String?)? onFieldSubmitted;
  final TextEditingController? controller;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.sm,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textStyle ?? context.textStyles.bodyLarge),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          autovalidateMode: autovalidateMode,
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
          maxLines: maxLines,
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
      // hintText: hintText,
      hint: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.xs),
        child: Text(
          hintText ?? '',
          style: context.textStyles.bodySmall.copyWith(
            color: context.theme.hintColor,
          ),
        ),
      ),
      errorText: errorText,
      // hintStyle: context.textStyles.bodySmall.copyWith(
      //   color: context.theme.hintColor,
      // ),
      suffixIcon: suffixIcon,
      isDense: true,
      isCollapsed: false,
      contentPadding: EdgeInsets.symmetric(
        vertical: AppSpacing.sl,
        horizontal: AppSpacing.sm,
      ),
    );
  }
}

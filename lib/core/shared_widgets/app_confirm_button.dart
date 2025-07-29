import 'package:Ainaa/config/extensions/context_extension.dart';
import 'package:Ainaa/constants/app_styles.dart';
import 'package:flutter/material.dart';

class AppConfirmButton extends StatelessWidget {
  const AppConfirmButton({
    super.key,
    required this.onPressed,
    required this.actionText,
  });

  final void Function()? onPressed;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: AppStyles.borderRadiusXS),
      ),
      child: Text(actionText, style: context.textStyles.confirmActionLabel),
    );
  }
}

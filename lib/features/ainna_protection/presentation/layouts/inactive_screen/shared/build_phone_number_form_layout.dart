// import 'package:blocker_windows/config/extensions/context_extension.dart';
// import 'package:blocker_windows/constants/app_icons.dart';
// import 'package:blocker_windows/constants/app_spacing.dart';
// import 'package:blocker_windows/core/utils/text_form_validations.dart';
// import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/providers/chosen_protection_provider.dart';
// import 'package:blocker_windows/l10n/generated/app_localizations.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class BuildPhoneNumberFormLayout extends StatelessWidget {
//   const BuildPhoneNumberFormLayout({super.key, required this.width});

//   final double width;
//   @override
//   Widget build(BuildContext context) {
//     final appLocalizations = AppLocalizations.of(context)!;
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal:
//             context.isMobile
//                 ? AppSpacing.sm
//                 : context.isTablet
//                 ? width * .15
//                 : width * .25,
//       ),
//       child: FormField<String>(
//         autovalidateMode: AutovalidateMode.onUnfocus,
//         validator:
//             (value) => (TextFormValidations.number(
//               appLocalization,
//               value,
//             )),
//         builder: (FormFieldState<String> field) {
//           return Column(
//             spacing: AppSpacing.sm,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 appLocalizations.phone_number,
//                 style: context.textStyles.bodyLarge,
//               ),
//               // BuildPhoneNumberTextFiledLayout(field),
//               SizedBox(height: AppSpacing.md),
//               BuildAinnaProtectionButton(field.isValid),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class BuildAinnaProtectionButton extends StatelessWidget {
//   // final GlobalKey<FormState> formKey;
//   final bool isFieldValid;
//   const BuildAinnaProtectionButton(this.isFieldValid, {super.key});
//   @override
//   Widget build(BuildContext context) {
//     final chosenProtectionProvider = context.watch<ChosenProtectionProvider>();
//     return SizedBox(
//       height: 72.spMin,
//       width: double.maxFinite,
//       child: ElevatedButton(
//         onPressed:
//             isFieldValid && chosenProtectionProvider.hasChoice() ? () {} : null,
//         child: _BuildAinnaProtectionButton(),
//       ),
//     );
//   }
// }

// class _BuildAinnaProtectionButton extends StatelessWidget {
//   const _BuildAinnaProtectionButton();
//   @override
//   Widget build(BuildContext context) {
//     final appLocalizations = AppLocalizations.of(context)!;
//     final theme = Theme.of(context);
//     return Row(
//       spacing: AppSpacing.sm,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(AppIcons.shield, size: 24.0, color: theme.scaffoldBackgroundColor),
//         Text(
//           appLocalizations.activate_protection,
//           style: context.textStyles.mainActionLabel,
//         ),
//       ],
//     );
//   }
// }

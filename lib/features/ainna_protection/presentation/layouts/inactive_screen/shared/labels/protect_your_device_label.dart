part of 'labels_layouts.dart';

class ProtectYourDeviceLabel extends StatelessWidget {
  const ProtectYourDeviceLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Center(
      child: Text.rich(
        TextSpan(
          text: appLocalizations.protect_your_device_now,
          style: context.textStyles.headingExtraLarge,
          // children: [
          //   TextSpan(
          //     text: '\n${appLocalizations.enter_phone_number_desc}',
          //     style: context.textStyles.bodyLarge,
          //   ),
          // ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

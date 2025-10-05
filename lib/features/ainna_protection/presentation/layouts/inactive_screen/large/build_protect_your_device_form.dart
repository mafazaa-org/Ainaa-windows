part of 'inactive_ainna_protection_large_layout.dart';

class _BuildProtectYourDeviceForm extends StatelessWidget {
  const _BuildProtectYourDeviceForm(this.width);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.md,
      children: [
        ProtectYourDeviceLabel(),
        SizedBox(height: AppSpacing.sm),
        // BuildPhoneNumberFormLayout(width: width),
        BuildAinnaProtectionButton(width: width),
        FoundUnprotectedSiteLabel(),
      ],
    );
  }
}

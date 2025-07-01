import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/constants/app_images_url.dart';
import 'package:blocker_windows/constants/app_spacing.dart';
import 'package:blocker_windows/core/shared_widgets/app_logo.dart';
import 'package:blocker_windows/features/support/data/mock_data/support_mock_data_impl.dart';
import 'package:blocker_windows/features/support/presentation/layouts/shared/financial_support_action_card.dart';
import 'package:blocker_windows/features/support/presentation/layouts/shared/join_us_action_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part './build_hero_image.dart';
part './build_card_actions.dart';

class SupportLargePage extends StatelessWidget {
  const SupportLargePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BuildHeroImage(SupportMockDataImpl.heading.get()),
        _BuildCardActions(),
      ],
    );
  }
}

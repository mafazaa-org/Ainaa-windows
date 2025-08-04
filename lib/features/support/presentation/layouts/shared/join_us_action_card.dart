import 'package:ainaa/core/shared_widgets/app_action_card.dart';
import 'package:ainaa/features/support/data/mock_data/support_mock_data_impl.dart';
import 'package:ainaa/features/support/presentation/cubit/support_us_cubit.dart';
import 'package:ainaa/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JoinUsActionCard extends StatelessWidget {
  const JoinUsActionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return AppActionCard(
      title: SupportMockDataImpl.joinUsTitle.get(),
      subTitle: SupportMockDataImpl.joinUsMsg.get(),
      actionLabel: appLocalizations.join_us,
      onPressed: context.read<SupportUsCubit>().joinUs,
    );
  }
}

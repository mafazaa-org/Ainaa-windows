import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/core/utils/app_error_wrapper.dart';
import 'package:blocker_windows/features/app_meta_data/presentation/get_app_meta_data_cubit/get_app_meta_data_cubit.dart';
import 'package:blocker_windows/features/app_meta_data/domain/entities/app_meta_data_entity.dart';
import 'package:blocker_windows/core/shared_widgets/app_loading_layout.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/pages/ainna_protection_page.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAppMetaDataCubit, AppMetaDataState>(
      builder:
          (context, state) => switch (state) {
            AppMetaDataInitialState() => _BuildInitLayout(),
            AppMetaDataOfflineState() => throw UnimplementedError(),
            AppMetaDataFetchedState(appMetaData: final appMetaData) =>
              _BuildFetchedStateLayout(appMetaData: appMetaData),
            AppMetaDataLoadingState() => AppLoadingLayout(),
            AppMetaDataFailedState(code: final code) => BuildFailureLayout(
              code: code,
            ),
          },
    );
  }
}

class _BuildFetchedStateLayout extends StatelessWidget {
  final AppMetaData appMetaData;

  const _BuildFetchedStateLayout({required this.appMetaData});

  @override
  Widget build(BuildContext context) {
    return AinnaProtectionPage(appMetaData);
  }
}

class BuildFailureLayout extends StatelessWidget {
  const BuildFailureLayout({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context)!;
    return Scaffold(
      body: Text(
        AppErrorMapper.map(code, appLocalization),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _BuildInitLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'init..',
        textAlign: TextAlign.center,
        style: context.textStyles.bodyMedium,
      ),
    );
  }
}

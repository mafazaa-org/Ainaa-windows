import 'package:blocker_windows/config/extensions/context_extension.dart';
import 'package:blocker_windows/core/app_init_data/get_app_meta_data_cubit/get_app_meta_data_cubit.dart';
import 'package:blocker_windows/core/app_init_data/domain/entities/app_meta_data_entity.dart';
import 'package:blocker_windows/core/app_init_data/get_app_version_cubit/get_app_version_cubit.dart';
import 'package:blocker_windows/core/shared_widgets/app_loading_layout.dart';
import 'package:blocker_windows/core/types/localized_string.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/pages/ainna_protection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetAppRequiredVersionCubit>().loadAppVersion();
    context.read<GetAppMetaDataCubit>().loadInitialMetaData();
    // insure first frame is rendered to not call hitTest early
    // WidgetsBinding.instance.addPersistentFrameCallback((_) {
    //   getAppMetaDataCubit.loadInitialMetaData();
    // });
  }

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
            AppMetaDataFailedState(message: final message) =>
              BuildFailureLayout(message: message),
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
  const BuildFailureLayout({super.key, required this.message});

  final LocalizedString message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text(message.get(), textAlign: TextAlign.center));
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

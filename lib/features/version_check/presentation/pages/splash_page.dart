import 'package:blocker_windows/constants/app_images_url.dart';
import 'package:blocker_windows/constants/dialog_overlay.dart';
import 'package:blocker_windows/constants/loading_overlay.dart';
import 'package:blocker_windows/core/shared_widgets/app_logo.dart';
import 'package:blocker_windows/features/app_meta_data/presentation/get_app_meta_data_cubit/get_app_meta_data_cubit.dart';
import 'package:blocker_windows/features/version_check/presentation/get_app_version_cubit/get_app_version_cubit.dart';
import 'package:blocker_windows/features/version_check/presentation/layouts/update_app_version/force_update_app_layout.dart';
import 'package:blocker_windows/features/version_check/presentation/layouts/update_app_version/optionally_update_app_layout.dart';
import 'package:blocker_windows/features/version_check/presentation/shared/navigate_to_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<GetAppRequiredVersionCubit>().loadAppVersion();
    context.read<GetAppMetaDataCubit>().loadInitialMetaData();
    _preloadImages();
  }

  void _preloadImages() {
    final images = [
      AppImagesUrl.mainLogo,
      AppImagesUrl.backgroundLogo,
      AppImagesUrl.supportBackground,
    ];

    for (final path in images) {
      precacheImage(AssetImage(path), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            BlocListener<GetAppRequiredVersionCubit, AppRequiredVersionState>(
              listener:
                  (context, state) => switch (state) {
                    Initial() => () {},
                    Loading() => LoadingOverlay.show(context),
                    Unmatched() => _handleUnmatchedVersion(context, state),
                    Matched() => navigateToHome(context),
                    AinnaFilesUnmatched() => _handleUpdatesTheFiles(
                      context,
                      state,
                    ),
                    // _ => LoadingOverlay.hide(),
                  },

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [AppLogo()],
              ),
            ),
      ),
    );
  }

  void _handleUnmatchedVersion(BuildContext context, Unmatched state) {
    LoadingOverlay.hide();
    if (state.isNecessaryUpdate) {
      DialogOverlay.show(
        context,
        child: ForceUpdateAppLayout(state.updateUrl, state.reasonMessage),
      );
    } else {
      DialogOverlay.show(
        context,
        child: OptionallyUpdateAppLayout(state.updateUrl, state.reasonMessage),
      );
    }
  }

  void _handleUpdatesTheFiles(BuildContext context, AinnaFilesUnmatched state) {
    //TODO: _handleUpdatesTheFiles layouts
    navigateToHome(context);
  }
}

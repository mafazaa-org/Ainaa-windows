import 'package:blocker_windows/config/dependency_injection/dependency_injection.dart';
import 'package:blocker_windows/config/theme/app_theme.dart';
import 'package:blocker_windows/constants/app_constants.dart';
import 'package:blocker_windows/features/app_meta_data/presentation/get_app_meta_data_cubit/get_app_meta_data_cubit.dart';
import 'package:blocker_windows/features/version_check/presentation/get_app_version_cubit/get_app_version_cubit.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/ainaa_domain_protection_cubit/ainaa_domain_protection_cubit.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/ainaa_protection_cubit/ainaa_protection_cubit.dart';
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/providers/chosen_protection_provider.dart';
import 'package:blocker_windows/features/app_meta_data/presentation/pages/init_page.dart';
import 'package:blocker_windows/features/version_check/presentation/pages/splash_page.dart';
import 'package:blocker_windows/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<GetAppMetaDataCubit>()),
        BlocProvider(create: (_) => getIt<AinaaProtectionCubit>()),
        BlocProvider(create: (_) => getIt<AinaaDomainProtectionCubit>()),
        BlocProvider(create: (_) => getIt<GetAppRequiredVersionCubit>()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ChosenProtectionProvider>(
            create: (_) => getIt<ChosenProtectionProvider>(),
          ),
        ],
        child: ScreenUtilInit(
          //ideal size
          // designSize: Size(1440, 1024),
          designSize: Size(
            AppConstants.smallTabletMinWidth,
            AppConstants.smallTabletMinHeight,
          ),
          builder: (_, _) {
            return MaterialApp(
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              showPerformanceOverlay: false,
              theme: AppTheme.light,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: AppLocalizations.supportedLocales.first,
              supportedLocales: const [Locale('ar'), Locale('en')],
              home: SplashPage(),
            );
          },
        ),
      ),
    );
  }
}

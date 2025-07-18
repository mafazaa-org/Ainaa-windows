import 'package:blocker_windows/app.dart';
import 'package:blocker_windows/config/dependency_injection/dependency_injection.dart';
import 'package:blocker_windows/core/settings/app_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize hydrated bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );

  await configurationDependency(Env.dev);

  //text styling according to sp
  await ScreenUtil.ensureScreenSize();

  //observe all app blocs
  Bloc.observer = const AppBlocObserver();

  runApp(const App());
}

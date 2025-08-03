// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:blocker_windows/features/ainna_protection/data/repositories/ainna_protection_repository_impl.dart'
    as _i640;
import 'package:blocker_windows/features/ainna_protection/data/repositories/ainna_test_protection_repository_impl.dart'
    as _i714;
import 'package:blocker_windows/features/ainna_protection/domain/repositories/ainna_protection_repository.dart'
    as _i304;
import 'package:blocker_windows/features/ainna_protection/presentation/ainaa_domain_protection_cubit/ainaa_domain_protection_cubit.dart'
    as _i401;
import 'package:blocker_windows/features/ainna_protection/presentation/ainaa_protection_cubit/ainaa_protection_cubit.dart'
    as _i384;
import 'package:blocker_windows/features/ainna_protection/presentation/layouts/inactive_screen/providers/chosen_protection_provider.dart'
    as _i912;
import 'package:blocker_windows/features/app_meta_data/data/repositories/app_meta_data_test_repository_impl.dart'
    as _i397;
import 'package:blocker_windows/features/app_meta_data/domain/repositories/app_meta_data_repository.dart'
    as _i1072;
import 'package:blocker_windows/features/app_meta_data/presentation/get_app_meta_data_cubit/get_app_meta_data_cubit.dart'
    as _i848;
import 'package:blocker_windows/features/report_problem/data/repositories/report_problem_repository_impl.dart'
    as _i495;
import 'package:blocker_windows/features/report_problem/data/repositories/report_problem_repository_test_impl.dart'
    as _i22;
import 'package:blocker_windows/features/report_problem/domain/repositories/report_problem_repository.dart'
    as _i105;
import 'package:blocker_windows/features/report_problem/presentation/cubit/report_problem_cubit.dart'
    as _i241;
import 'package:blocker_windows/features/support/data/repositories/support_repository_impl.dart'
    as _i575;
import 'package:blocker_windows/features/support/domain/repositories/support_repository.dart'
    as _i518;
import 'package:blocker_windows/features/support/presentation/cubit/support_us_cubit.dart';
import 'package:blocker_windows/features/version_check/data/repositories/app_required_version_repository_impl.dart'
    as _i192;
import 'package:blocker_windows/features/version_check/domain/repositories/app_required_version_repository.dart'
    as _i68;
import 'package:blocker_windows/features/version_check/presentation/get_app_version_cubit/get_app_version_cubit.dart'
    as _i744;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i912.ChosenProtectionProvider>(
      () => _i912.ChosenProtectionProvider(),
    );
    gh.singleton<_i68.AppRequiredVersionRepository>(
      () => _i192.AppRequiredVersionRepositoryImpl(),
    );
    gh.singleton<_i518.SupportRepository>(() => _i575.SupportRepositoryImpl());
    gh.singleton<_i1072.AppMetaDataRepository>(
      () => _i397.AppMetaDataTestRepositoryImpl(),
    );
    gh.singleton<_i105.ReportProblemRepository>(
      () => _i22.ReportProblemRepositoryTestImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i304.AinnaProtectionRepository>(
      () => _i714.AinnaTestProtectionRepositoryImpl(),
      registerFor: {_dev},
    );
    gh.singleton<SupportUsCubit>(
      () => SupportUsCubit(gh<_i518.SupportRepository>()),
    );
    gh.singleton<_i848.GetAppMetaDataCubit>(
      () => _i848.GetAppMetaDataCubit(gh<_i1072.AppMetaDataRepository>()),
    );
    gh.singleton<_i304.AinnaProtectionRepository>(
      () => _i640.AinnaProtectionRepositoryImpl(),
      registerFor: {_prod},
    );
    gh.singleton<_i105.ReportProblemRepository>(
      () => _i495.ReportProblemRepositoryImpl(),
      registerFor: {_prod},
    );
    gh.factory<_i241.ReportProblemCubit>(
      () => _i241.ReportProblemCubit(gh<_i105.ReportProblemRepository>()),
    );
    gh.singleton<_i401.AinaaDomainProtectionCubit>(
      () => _i401.AinaaDomainProtectionCubit(
        gh<_i304.AinnaProtectionRepository>(),
      ),
    );
    gh.singleton<_i384.AinaaProtectionCubit>(
      () => _i384.AinaaProtectionCubit(gh<_i304.AinnaProtectionRepository>()),
    );
    gh.singleton<_i744.GetAppRequiredVersionCubit>(
      () => _i744.GetAppRequiredVersionCubit(
        gh<_i68.AppRequiredVersionRepository>(),
      ),
    );
    return this;
  }
}

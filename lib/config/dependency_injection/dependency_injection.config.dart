// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:Ainaa/core/app_init_data/data/repositories/app_meta_data_test_repository_impl.dart'
    as _i811;
import 'package:Ainaa/core/app_init_data/data/repositories/app_required_version_repository_impl.dart'
    as _i668;
import 'package:Ainaa/core/app_init_data/domain/repositories/app_meta_data_repository.dart'
    as _i1037;
import 'package:Ainaa/core/app_init_data/domain/repositories/app_required_version_repository.dart'
    as _i252;
import 'package:Ainaa/core/app_init_data/get_app_meta_data_cubit/get_app_meta_data_cubit.dart'
    as _i433;
import 'package:Ainaa/core/app_init_data/get_app_version_cubit/get_app_version_cubit.dart'
    as _i635;
import 'package:Ainaa/features/ainna_protection/data/repositories/ainna_protection_repository_impl.dart'
    as _i640;
import 'package:Ainaa/features/ainna_protection/data/repositories/ainna_test_protection_repository_impl.dart'
    as _i714;
import 'package:Ainaa/features/ainna_protection/domain/repositories/ainna_protection_repository.dart'
    as _i304;
import 'package:Ainaa/features/ainna_protection/presentation/ainaa_domain_protection_cubit/ainaa_domain_protection_cubit.dart'
    as _i401;
import 'package:Ainaa/features/ainna_protection/presentation/ainaa_protection_cubit/ainaa_protection_cubit.dart'
    as _i384;
import 'package:Ainaa/features/ainna_protection/presentation/layouts/inactive_screen/providers/chosen_protection_provider.dart'
    as _i912;
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
    gh.singleton<_i252.AppRequiredVersionRepository>(
      () => _i668.AppRequiredVersionRepositoryImpl(),
    );
    gh.singleton<_i1037.AppMetaDataRepository>(
      () => _i811.AppMetaDataTestRepositoryImpl(),
    );
    gh.singleton<_i304.AinnaProtectionRepository>(
      () => _i714.AinnaTestProtectionRepositoryImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i433.GetAppMetaDataCubit>(
      () => _i433.GetAppMetaDataCubit(gh<_i1037.AppMetaDataRepository>()),
    );
    gh.singleton<_i304.AinnaProtectionRepository>(
      () => _i640.AinnaProtectionRepositoryImpl(),
      registerFor: {_prod},
    );
    gh.singleton<_i401.AinaaDomainProtectionCubit>(
      () => _i401.AinaaDomainProtectionCubit(
        gh<_i304.AinnaProtectionRepository>(),
      ),
    );
    gh.singleton<_i384.AinaaProtectionCubit>(
      () => _i384.AinaaProtectionCubit(gh<_i304.AinnaProtectionRepository>()),
    );
    gh.singleton<_i635.GetAppRequiredVersionCubit>(
      () => _i635.GetAppRequiredVersionCubit(
        gh<_i252.AppRequiredVersionRepository>(),
      ),
    );
    return this;
  }
}

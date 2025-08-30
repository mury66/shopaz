// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/network/commerce_client.dart' as _i56;
import 'features/auth/data/datasources/auth_remote_ds.dart' as _i431;
import 'features/auth/data/datasources/auth_remote_ds_impl.dart' as _i789;
import 'features/auth/data/reposiotry/auth_repo_impl.dart' as _i291;
import 'features/auth/domain/repository/auth_repo.dart' as _i38;
import 'features/auth/domain/usecases/login_usecase.dart' as _i206;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i363;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i56.CommerceClient>(() => dioModule.commerceClient);
    gh.factory<_i431.AuthRemoteDS>(() => _i789.AuthRemoteDSImpl());
    gh.factory<_i38.AuthRepo>(
      () => _i291.AuthRepoImpl(gh<_i431.AuthRemoteDS>()),
    );
    gh.factory<_i206.LoginUseCase>(
      () => _i206.LoginUseCase(gh<_i38.AuthRepo>()),
    );
    gh.factory<_i363.AuthBloc>(() => _i363.AuthBloc(gh<_i206.LoginUseCase>()));
    return this;
  }
}

class _$DioModule extends _i56.DioModule {}

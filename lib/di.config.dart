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
import 'features/auth/domain/usecases/signup_usecase.dart' as _i100;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i363;
import 'features/cart/data/datasource/ds.dart' as _i783;
import 'features/cart/data/repo/cart_repo_impl.dart' as _i858;
import 'features/cart/domain/repo/cart_repo.dart' as _i411;
import 'features/cart/domain/usecases/add_to_cart_usecase.dart' as _i187;
import 'features/cart/domain/usecases/get_cart_items_usecase.dart' as _i403;
import 'features/cart/presentation/bloc/cart_bloc.dart' as _i239;
import 'features/main_layout/categories/data/datasource/sub_category_ds.dart'
    as _i511;
import 'features/main_layout/categories/data/repo/subcategory_repo_impl.dart'
    as _i82;
import 'features/main_layout/categories/domain/repo/subcategory_repo.dart'
    as _i1071;
import 'features/main_layout/categories/domain/usecases/get_sub_category_usecase.dart'
    as _i92;
import 'features/main_layout/categories/presentation/bloc/category_bloc.dart'
    as _i916;
import 'features/main_layout/home/data/datasources/home_remote_ds.dart'
    as _i427;
import 'features/main_layout/home/data/repo/home_repo_impl.dart' as _i573;
import 'features/main_layout/home/domain/repo/home_repo.dart' as _i347;
import 'features/main_layout/home/domain/usecase/get_brands_usecase.dart'
    as _i306;
import 'features/main_layout/home/domain/usecase/get_categories_usecase.dart'
    as _i726;
import 'features/main_layout/home/presentation/bloc/home_bloc.dart' as _i123;
import 'features/products_screen/data/data_sources/ds.dart' as _i340;
import 'features/products_screen/data/repo/products_repo_impl.dart' as _i399;
import 'features/products_screen/domain/repo/products_repo.dart' as _i801;
import 'features/products_screen/domain/usecases/get_products.dart' as _i737;
import 'features/products_screen/presentation/bloc/products_bloc.dart' as _i966;

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
    gh.factory<_i427.HomeRemoteDS>(() => _i427.HomeRemoteDSImpl());
    gh.factory<_i783.CartDS>(() => _i783.CartDSImpl());
    gh.factory<_i340.ProdDs>(() => _i340.ProdDSImpl());
    gh.factory<_i511.SubCategoryDS>(() => _i511.SubCategoryDSImpl());
    gh.factory<_i431.AuthRemoteDS>(() => _i789.AuthRemoteDSImpl());
    gh.factory<_i411.CartRepo>(() => _i858.CartRepoIMpl(gh<_i783.CartDS>()));
    gh.factory<_i801.ProductsRepo>(
      () => _i399.ProductsRepoImpl(gh<_i340.ProdDs>()),
    );
    gh.factory<_i187.AddToCartUseCase>(
      () => _i187.AddToCartUseCase(gh<_i411.CartRepo>()),
    );
    gh.factory<_i403.GetCartItemsUseCase>(
      () => _i403.GetCartItemsUseCase(gh<_i411.CartRepo>()),
    );
    gh.factory<_i1071.SubCategoryRepo>(
      () => _i82.SubCategoryRepoImpl(gh<_i511.SubCategoryDS>()),
    );
    gh.factory<_i38.AuthRepo>(
      () => _i291.AuthRepoImpl(gh<_i431.AuthRemoteDS>()),
    );
    gh.factory<_i347.HomeRepo>(
      () => _i573.HomeRepoImpl(gh<_i427.HomeRemoteDS>()),
    );
    gh.factory<_i92.GetSubCategoryUseCase>(
      () => _i92.GetSubCategoryUseCase(gh<_i1071.SubCategoryRepo>()),
    );
    gh.factory<_i206.LoginUseCase>(
      () => _i206.LoginUseCase(gh<_i38.AuthRepo>()),
    );
    gh.factory<_i100.SignUpUseCase>(
      () => _i100.SignUpUseCase(gh<_i38.AuthRepo>()),
    );
    gh.factory<_i363.AuthBloc>(
      () => _i363.AuthBloc(gh<_i206.LoginUseCase>(), gh<_i100.SignUpUseCase>()),
    );
    gh.factory<_i737.GetProductsUseCase>(
      () => _i737.GetProductsUseCase(gh<_i801.ProductsRepo>()),
    );
    gh.factory<_i726.GetCategoriesUseCase>(
      () => _i726.GetCategoriesUseCase(gh<_i347.HomeRepo>()),
    );
    gh.factory<_i306.GetBrandsUseCase>(
      () => _i306.GetBrandsUseCase(gh<_i347.HomeRepo>()),
    );
    gh.factory<_i239.CartBloc>(
      () => _i239.CartBloc(
        gh<_i187.AddToCartUseCase>(),
        gh<_i403.GetCartItemsUseCase>(),
      ),
    );
    gh.factory<_i966.ProductsBloc>(
      () => _i966.ProductsBloc(
        gh<_i737.GetProductsUseCase>(),
        gh<_i187.AddToCartUseCase>(),
      ),
    );
    gh.factory<_i916.CategoryBloc>(
      () => _i916.CategoryBloc(
        gh<_i726.GetCategoriesUseCase>(),
        gh<_i92.GetSubCategoryUseCase>(),
      ),
    );
    gh.factory<_i123.HomeBloc>(
      () => _i123.HomeBloc(
        gh<_i726.GetCategoriesUseCase>(),
        gh<_i306.GetBrandsUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i56.DioModule {}

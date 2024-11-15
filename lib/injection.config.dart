// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shopy_file_gp2/src/data/dataSource/local/SharedPref.dart'
    as _i963;
import 'package:shopy_file_gp2/src/data/dataSource/remote/services/AddressService.dart'
    as _i606;
import 'package:shopy_file_gp2/src/data/dataSource/remote/services/AuthServices.dart'
    as _i849;
import 'package:shopy_file_gp2/src/data/dataSource/remote/services/CategoriesService.dart'
    as _i671;
import 'package:shopy_file_gp2/src/data/dataSource/remote/services/ProductsService.dart'
    as _i561;
import 'package:shopy_file_gp2/src/di/AppModule.dart' as _i900;
import 'package:shopy_file_gp2/src/domain/repository/AddressRepository.dart'
    as _i816;
import 'package:shopy_file_gp2/src/domain/repository/AuthRepository.dart'
    as _i902;
import 'package:shopy_file_gp2/src/domain/repository/CategoriesRepository.dart'
    as _i579;
import 'package:shopy_file_gp2/src/domain/repository/ProductsRepository.dart'
    as _i712;
import 'package:shopy_file_gp2/src/domain/repository/ShoppingBagRepository.dart'
    as _i803;
import 'package:shopy_file_gp2/src/domain/useCases/address/AddressUseCases.dart'
    as _i907;
import 'package:shopy_file_gp2/src/domain/useCases/auth/AuthUseCases.dart'
    as _i406;
import 'package:shopy_file_gp2/src/domain/useCases/categories/CategoriesUseCases.dart'
    as _i588;
import 'package:shopy_file_gp2/src/domain/useCases/products/ProductsUseCases.dart'
    as _i21;
import 'package:shopy_file_gp2/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart'
    as _i934;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i963.SharedPref>(() => appModule.sharedPref);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i849.AuthServices>(() => appModule.authServices);
    gh.factory<_i671.CategoriesService>(() => appModule.categoriesService);
    gh.factory<_i561.ProductsService>(() => appModule.productsService);
    gh.factory<_i606.AddressService>(() => appModule.addressService);
    gh.factory<_i902.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i579.CategoriesRepository>(
        () => appModule.categoriesRepository);
    gh.factory<_i712.ProductsRepository>(() => appModule.productsRepository);
    gh.factory<_i803.ShoppingBagRepository>(
        () => appModule.shoppingBagRepository);
    gh.factory<_i816.AddressRepository>(() => appModule.addressRepository);
    gh.factory<_i406.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i588.CategoriesUseCases>(() => appModule.categoriesUseCases);
    gh.factory<_i21.ProductsUseCases>(() => appModule.productsUseCases);
    gh.factory<_i934.ShoppingBagUseCases>(() => appModule.shoppingBagUseCases);
    gh.factory<_i907.AddressUseCases>(() => appModule.addressUseCases);
    return this;
  }
}

class _$AppModule extends _i900.AppModule {}

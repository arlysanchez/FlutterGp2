import 'package:injectable/injectable.dart';
import 'package:shopy_file_gp2/src/data/dataSource/local/SharedPref.dart';
import 'package:shopy_file_gp2/src/data/dataSource/remote/services/AddressService.dart';
import 'package:shopy_file_gp2/src/data/dataSource/remote/services/AuthServices.dart';
import 'package:shopy_file_gp2/src/data/dataSource/remote/services/CategoriesService.dart';
import 'package:shopy_file_gp2/src/data/dataSource/remote/services/ProductsService.dart';
import 'package:shopy_file_gp2/src/data/repository/AddressRepositoryImpl.dart';
import 'package:shopy_file_gp2/src/data/repository/AuthRepositoryImpl.dart';
import 'package:shopy_file_gp2/src/data/repository/CategoriesRepositoryImpl.dart';
import 'package:shopy_file_gp2/src/data/repository/ProductsRepositoryImpl.dart';
import 'package:shopy_file_gp2/src/data/repository/ShoppingBagRepositoryImpl.dart';
import 'package:shopy_file_gp2/src/domain/models/AuthResponse.dart';
import 'package:shopy_file_gp2/src/domain/repository/AddressRepository.dart';
import 'package:shopy_file_gp2/src/domain/repository/AuthRepository.dart';
import 'package:shopy_file_gp2/src/domain/repository/CategoriesRepository.dart';
import 'package:shopy_file_gp2/src/domain/repository/ProductsRepository.dart';
import 'package:shopy_file_gp2/src/domain/repository/ShoppingBagRepository.dart';
import 'package:shopy_file_gp2/src/domain/useCases/ShoppingBag/AddShoppingBagUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/ShoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/ShoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/ShoppingBag/GetProductsShoppingBagUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/ShoppingBag/GetTotalShoppingBagUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/AddressUseCases.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/CreateAddressUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/DeleteAddressFromSessionUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/DeleteAddressUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/GetAddressSessionUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/GetUserAddressUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/SaveAddressInSessionUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:shopy_file_gp2/src/domain/useCases/categories/CreateCategoriesUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/categories/DeleteCategoriesUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/categories/GetCategoriesUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/categories/UpdateCategoriesUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/products/CreateProductUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/products/DeleteProductUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/products/GetProductsByCategoryUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:shopy_file_gp2/src/domain/useCases/products/UpdateProductUseCase.dart';

@module
abstract class AppModule {
  @injectable
  SharedPref get sharedPref => SharedPref();

  @injectable
  Future<String> get token async {
    String token = "";
    final userSession = await sharedPref.read('user');
    if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
    }
    return token;
  }

//services
  @injectable
  AuthServices get authServices => AuthServices();

  @injectable
  CategoriesService get categoriesService => CategoriesService(token);
  @injectable
  ProductsService get productsService => ProductsService(token);

  @injectable
  AddressService get addressService => AddressService(token);

//repository
  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authServices, sharedPref);

  @injectable
  CategoriesRepository get categoriesRepository =>
      CategoriesRepositoryimpl(categoriesService);

  @injectable
  ProductsRepository get productsRepository =>
      ProductsRepositoryImpl(productsService);

  @injectable
  ShoppingBagRepository get shoppingBagRepository =>
      ShoppingBagRepositoryImpl(sharedPref);

  @injectable
  AddressRepository get addressRepository =>
      AddressRepositoryImpl(addressService, sharedPref);

//Use Cases
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
      login: LoginUseCase(authRepository),
      register: RegisterUseCase(authRepository),
      getUserSession: GetUserSessionUseCase(authRepository),
      saveUserSession: SaveUserSessionUseCase(authRepository),
      logout: LogoutUseCase(authRepository));

  @injectable
  CategoriesUseCases get categoriesUseCases => CategoriesUseCases(
      create: CreateCategoriesUseCase(categoriesRepository),
      getCategories: GetCategoriesUseCase(categoriesRepository),
      update: UpdateCategoriesUseCase(categoriesRepository),
      delete: DeleteCategoriesUseCase(categoriesRepository));

  @injectable
  ProductsUseCases get productsUseCases => ProductsUseCases(
      create: CreateProductUseCase(productsRepository),
      getProductsByCategory: GetProductsByCategoryUseCase(productsRepository),
      update: UpdateProductUseCase(productsRepository),
      delete: DeleteProductUseCase(productsRepository));

  @injectable
  ShoppingBagUseCases get shoppingBagUseCases => ShoppingBagUseCases(
      add: AddShoppingBagUseCase(shoppingBagRepository),
      getProducts: GetProductsShoppingBagUseCase(shoppingBagRepository),
      deleteItem: DeleteItemShoppinBagUseCase(shoppingBagRepository),
      deleteShoppingBag: deleteShoppingBagUseCase(shoppingBagRepository),
      getTotal: GetTotalShoppingBagUseCase(shoppingBagRepository));
  @injectable
  AddressUseCases get addressUseCases => AddressUseCases(
      create: CreateAddressUseCase(addressRepository),
      getUserAddress: GetUserAddressUseCase(addressRepository),
      saveAddressInSession: SaveAddressInSessionUseCase(addressRepository),
      getAddressSession: GetAddressSessionUseCase(addressRepository),
      delete: DeleteAddressUseCase(addressRepository),
      deleteFromSession: DeleteAddressFromSessionUseCase(addressRepository));
}

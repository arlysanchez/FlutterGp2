import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_file_gp2/injection.dart';
import 'package:shopy_file_gp2/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/AddressUseCases.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:shopy_file_gp2/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:shopy_file_gp2/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/create/bloc/ClientAddressCreateBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/create/bloc/ClientAddressCreateEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/list/bloc/ClientAddressListBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/category/list/bloc/ClienteCategoryListBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/product/detail/bloc/ClientProductDetailBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/product/list/bloc/ClienteProductListBloc.dart';

List<BlocProvider> blocProvider = [
  BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(locator<AuthUseCases>())..add(InitEvent())),
  BlocProvider<RegisterBloc>(
      create: (context) =>
          RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
  BlocProvider<ClientHomeBloc>(
      create: (context) => ClientHomeBloc(locator<AuthUseCases>())),
  BlocProvider<AdminHomeBloc>(
      create: (context) => AdminHomeBloc(locator<AuthUseCases>())),
  BlocProvider<AdminCategoryListBloc>(
      create: (context) =>
          AdminCategoryListBloc(locator<CategoriesUseCases>())),
  BlocProvider<AdminCategoryCreateBloc>(
      create: (context) =>
          AdminCategoryCreateBloc(locator<CategoriesUseCases>())
            ..add(AdminCategoryCreateInitEvent())),
  BlocProvider<AdminCategoryUpdateBloc>(
      create: (context) =>
          AdminCategoryUpdateBloc(locator<CategoriesUseCases>())),
  BlocProvider<AdminProductListBloc>(
      create: (context) => AdminProductListBloc(locator<ProductsUseCases>())),
  BlocProvider<AdminProductCreateBloc>(
      create: (context) => AdminProductCreateBloc(locator<ProductsUseCases>())),
  BlocProvider<AdminProductUpdateBloc>(
      create: (context) => AdminProductUpdateBloc(locator<ProductsUseCases>())),
  BlocProvider<ClienteCategoryListBloc>(
      create: (context) =>
          ClienteCategoryListBloc(locator<CategoriesUseCases>())),
  BlocProvider<ClienteProductListBloc>(
      create: (context) => ClienteProductListBloc(locator<ProductsUseCases>())),
  BlocProvider<ClientProductDetailBloc>(
      create: (context) =>
          ClientProductDetailBloc(locator<ShoppingBagUseCases>())),
  BlocProvider<ClientShoppingBagBloc>(
      create: (context) =>
          ClientShoppingBagBloc(locator<ShoppingBagUseCases>())),
  BlocProvider<ClientAddressListBloc>(
      create: (context) => ClientAddressListBloc(
          locator<AddressUseCases>(), locator<AuthUseCases>())),
  BlocProvider<ClientAddressCreateBloc>(
      create: (context) => ClientAddressCreateBloc(
          locator<AddressUseCases>(), locator<AuthUseCases>())
        ..add(ClientAddressCreateInitEvent())),
];

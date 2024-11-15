import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopy_file_gp2/injection.dart';
import 'package:shopy_file_gp2/src/presentation/pages/BlocProvider.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/category/create/AdminCategoryCreatePage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/category/update/AdminCategoryUpdatePage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/home/AdminHomePage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/product/create/AdminProductCreatePage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/product/list/AdminProductListPage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/product/update/AdminProductUpdatePage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/ShoppingBag/ClientShoppingBagPage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/create/ClientAddressCreatePage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/list/ClientAddressListPage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/home/ClientHomePage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/product/detail/ClientProductDetailPage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/product/list/ClienteProductListPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencias();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProvider,
      child: MaterialApp(
        builder: FToastBuilder(), //activar las notificaciones de forma global
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'client/home': (BuildContext context) => ClientHomePage(),
          'admin/home': (BuildContext context) => AdminHomePage(),
          'admin/category/create': (BuildContext context) =>
              AdminCategoryCreatePage(),
          'admin/category/update': (BuildContext context) =>
              AdminCategoryUpdatePage(),
          'admin/product/list': (BuildContext context) =>
              AdminProductListPage(),
          'admin/product/create': (BuildContext context) =>
              AdminProductCreatePage(),
          'admin/product/update': (BuildContext context) =>
              AdminProductUpdatePage(),
          'client/product/list': (BuildContext context) =>
              ClientProductListPage(),
          'client/product/detail': (BuildContext context) =>
              ClientProductDetailPage(),
          'client/shopping_bag': (BuildContext context) =>
              ClientShoppingBagPage(),
          'client/address/list': (BuildContext context) =>
              ClientAddressListPage(),
          'client/address/create': (BuildContext context) =>
              ClientAddressCreatePage(),
        },
      ),
    );
  }
}

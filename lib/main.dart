import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopy_file_gp2/injection.dart';
import 'package:shopy_file_gp2/src/presentation/pages/BlocProvider.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/home/ClientHomePage.dart';

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
      builder: FToastBuilder(),//activar las notificaciones de forma global
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
        'client/home':(BuildContext context) =>ClientHomePage(),
      },
    ),
    );

  }
}

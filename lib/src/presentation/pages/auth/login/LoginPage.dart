import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopy_file_gp2/src/domain/models/AuthResponse.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/login/bloc/LoginState.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
        body: Container(
      width: double.infinity,
      child: BlocListener<LoginBloc, LoginState>(listener: (context, state) {
        final responseState = state.response;
        if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
        } else if (responseState is Success) {
          final authResponse = responseState.data as AuthResponse;
          //_bloc?.add(LoginFormReset());
          _bloc?.add(LoginSaveSession(authResponse: authResponse));
          Fluttertoast.showToast(
              msg: 'Login exitoso', toastLength: Toast.LENGTH_LONG);
          if (authResponse.user.roles != null) {
            final role = authResponse.user.roles!.first;
            if (role?.id == 'CLIENT') {
              // Si el  rol es 'CLIENT', redirigir al HomePage del cliente
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'client/home', (route) => false);
              });
            } else {
              // Si el  rol es 'ADMIN', redirigir al HomePage del cliente
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'admin/home', (route) => false);
              });
            }
          }
        }
      }, child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        final responseState = state.response;
        if (responseState is Loading) {
          return Stack(
            children: [
              LoginContent(_bloc, state),
              Center(child: CircularProgressIndicator())
            ],
          );
        }
        return LoginContent(_bloc, state);
      })),
    ));
  }
}

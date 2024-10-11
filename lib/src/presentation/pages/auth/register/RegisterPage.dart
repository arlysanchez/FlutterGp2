import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/register/RegisterContent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/register/bloc/RegisterState.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc? _bloc;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   _registerBlocCubit?.dispose();
    // });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<RegisterBloc>(context);

    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // color: Colors.black,
            child: BlocListener<RegisterBloc, RegisterState>(
                listener: (context, state) {
              final responseState = state.response;
              if (responseState is Error) {
                Fluttertoast.showToast(
                    msg: responseState.message, toastLength: Toast.LENGTH_LONG);
              } else if (responseState is Success) {
                _bloc?.add(RegisterFormReset());
                 Navigator.pop(context);
                Fluttertoast.showToast(
                    msg: 'Registro exitoso', toastLength: Toast.LENGTH_LONG);
              }
            }, child: BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
              final responseState = state.response;
              if (responseState is Loading) {
                return Stack(
                  children: [
                    RegisterContent(_bloc, state),
                    Center(child: CircularProgressIndicator())
                  ],
                );
              }

              return RegisterContent(_bloc, state);
            }))));
  }
}

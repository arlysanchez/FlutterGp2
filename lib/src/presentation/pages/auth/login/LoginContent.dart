import 'package:flutter/material.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:shopy_file_gp2/src/presentation/utils/BlocFormItem.dart';
import 'package:shopy_file_gp2/src/presentation/widget/DefaultTextField.dart';

class LoginContent extends StatelessWidget {
  LoginBloc? bloc;
  LoginState state;

  LoginContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackground(context),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.80,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.3),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Column(
              children: [
                _iconPerson(),
                _textLogin(),
                _TextFieldEmail(),
                _TextFieldPassword(),
                _buttonLogin(context),
                _buttonRegister(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background2.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Colors.black54,
      colorBlendMode: BlendMode.darken,
    );
  }

  Widget _iconPerson() {
    return Icon(
      Icons.person,
      color: Colors.white,
      size: 125,
    );
  }

  Widget _textLogin() {
    return Text(
      'LOGIN',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _TextFieldEmail() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'email',
        icon: Icons.email,
        onChange: (text) {
          bloc?.add(EmailChanged(email: BlocFormItem(value: text)));
          print('Text: ${text}');
        },
        validator: (value) {
          return state.email.error;
        },
      ),
    );
  }

  Widget _TextFieldPassword() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
          label: 'Password',
          icon: Icons.lock,
          onChange: (text) {
            bloc?.add(PasswordChanged(password: BlocFormItem(value: text)));
          },
          obscureText: true,
          validator: (value) {
            return state.password.error;
          }),
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
      child: ElevatedButton(
          onPressed: () {
            if (state.formKey!.currentState!.validate()) {
              bloc?.add(LoginSubmit());
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: Text(
            'Iniciar Sesion',
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          child: Text(
            'Registrese',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

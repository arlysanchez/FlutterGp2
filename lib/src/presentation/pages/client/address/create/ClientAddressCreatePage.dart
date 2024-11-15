import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/create/ClientAddressCreateContent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/create/bloc/ClientAddressCreateBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/create/bloc/ClientAddressCreateState.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/list/bloc/ClientAddressListBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/list/bloc/ClientAddressListEvent.dart';

class ClientAddressCreatePage extends StatefulWidget {
  const ClientAddressCreatePage({super.key});

  @override
  State<ClientAddressCreatePage> createState() =>
      _ClientAddressCreatePageState();
}

class _ClientAddressCreatePageState extends State<ClientAddressCreatePage> {
  ClientAddressCreateBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientAddressCreateBloc>(context);
    return Scaffold(
      body: BlocListener<ClientAddressCreateBloc, ClientAddressCreateState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            context.read<ClientAddressListBloc>().add(GetUserAddress());
            // _bloc?.add(ResetForm());
            Fluttertoast.showToast(
                msg: 'La direccion se creo correctamente',
                toastLength: Toast.LENGTH_LONG);
            Navigator.pop(context);
          } else if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<ClientAddressCreateBloc, ClientAddressCreateState>(
          builder: (context, state) {
            return ClientAddressCreateContent(_bloc, state);
          },
        ),
      ),
    );
  }
}

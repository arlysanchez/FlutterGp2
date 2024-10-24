import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopy_file_gp2/src/domain/models/Category.dart';
import 'package:shopy_file_gp2/src/domain/models/Product.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/product/list/ClienteProductListItem.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/product/list/bloc/ClienteProductListBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/product/list/bloc/ClienteProductListEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/product/list/bloc/ClienteProductListState.dart';

class ClientProductListPage extends StatefulWidget {
  const ClientProductListPage({super.key});

  @override
  State<ClientProductListPage> createState() => _ClientProductListPageState();
}

class _ClientProductListPageState extends State<ClientProductListPage> {
  ClienteProductListBloc? _bloc;
  Category? category;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (category != null) {
        _bloc?.add(GetProductsByCategory(idCategory: category!.id!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context)?.settings.arguments as Category;
    _bloc = BlocProvider.of<ClienteProductListBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Productos'),
        ),
        body: BlocListener<ClienteProductListBloc, ClienteProductListState>(
            listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            if (responseState.data is bool) {
              _bloc?.add(GetProductsByCategory(idCategory: category!.id!));
            }
          } else if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        }, child: BlocBuilder<ClienteProductListBloc, ClienteProductListState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (responseState is Success) {
              List<Product> products = responseState.data as List<Product>;
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ClientProductListItem(_bloc, products[index]);
                  });
            }
            return Container();
          },
        )));
  }
}

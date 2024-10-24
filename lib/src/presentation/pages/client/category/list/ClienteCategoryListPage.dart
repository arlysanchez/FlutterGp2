import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopy_file_gp2/src/domain/models/Category.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/category/list/ClienteCategoryListItem.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/category/list/bloc/ClienteCategoryListBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/category/list/bloc/ClienteCategoryListEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/category/list/bloc/ClienteCategoryListState.dart';

class ClienteCategoryListPage extends StatefulWidget {
  const ClienteCategoryListPage({super.key});

  @override
  State<ClienteCategoryListPage> createState() =>
      _ClienteCategoryListPageState();
}

class _ClienteCategoryListPageState extends State<ClienteCategoryListPage> {
  ClienteCategoryListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetCategories());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClienteCategoryListBloc>(context);
    return Scaffold(
        body: BlocListener<ClienteCategoryListBloc, ClienteCategoryListState>(
      listener: (context, state) {
        final responseState = state.response;
        if (responseState is Success) {
          if (responseState.data is bool) {
            _bloc?.add(GetCategories());
          }
        }
        if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<ClienteCategoryListBloc, ClienteCategoryListState>(
        builder: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            List<Category> categories = responseState.data as List<Category>;
            return ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ClientCategoryListItem(_bloc, categories[index]);
                });
          }
          return Container();
        },
      ),
    ));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_file_gp2/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/product/list/bloc/ClienteProductListEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/product/list/bloc/ClienteProductListState.dart';

class ClienteProductListBloc
    extends Bloc<ClienteProductListEvent, ClienteProductListState> {
  ProductsUseCases productsUseCases;

  ClienteProductListBloc(this.productsUseCases)
      : super(ClienteProductListState()) {
    on<GetProductsByCategory>(_onGetProductsByCategory);
  }

  Future<void> _onGetProductsByCategory(GetProductsByCategory event,
      Emitter<ClienteProductListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response =
        await productsUseCases.getProductsByCategory.run(event.idCategory);
    emit(state.copyWith(response: response));
  }
}

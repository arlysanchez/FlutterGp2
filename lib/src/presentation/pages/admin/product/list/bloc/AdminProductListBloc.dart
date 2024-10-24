import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_file_gp2/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/product/list/bloc/AdminProductListEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/product/list/bloc/AdminProductListState.dart';

class AdminProductListBloc
    extends Bloc<AdminProductListEvent, AdminProductListState> {
  ProductsUseCases productsUseCases;

  AdminProductListBloc(this.productsUseCases) : super(AdminProductListState()) {
    on<GetProductsByCategory>(_onGetProductsByCategory);
    on<DeleteProduct>(_onDeleteProduct);
  }

  Future<void> _onGetProductsByCategory(
      GetProductsByCategory event, Emitter<AdminProductListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response =
        await productsUseCases.getProductsByCategory.run(event.idCategory);
    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteProduct(
      DeleteProduct event, Emitter<AdminProductListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await productsUseCases.delete.run(event.id);
    emit(state.copyWith(response: response));
  }
}

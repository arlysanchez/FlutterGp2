import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_file_gp2/src/domain/models/Product.dart';
import 'package:shopy_file_gp2/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/product/detail/bloc/ClientProductDetailEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/product/detail/bloc/ClientProductDetailState.dart';

class ClientProductDetailBloc
    extends Bloc<ClientProductDetailEvent, ClientProductDetailState> {
  ShoppingBagUseCases shoppingBagUseCases;

  ClientProductDetailBloc(this.shoppingBagUseCases)
      : super(ClientProductDetailState()) {
    on<GetProducts>(_onGetProducts);
    on<AddItem>(_onAddItem);
    on<SubtractItem>(_onSubtractItem);
    on<AddProductToShoppingBag>(_onAddProductToShoppingBag);
    on<ResetState>(_onResetState);
  }

  Future<void> _onGetProducts(
      GetProducts event, Emitter<ClientProductDetailState> emit) async {
    List<Product> products = await shoppingBagUseCases.getProducts.run();
    int index = products.indexWhere((p) => p.id == event.product.id);
    if (index != -1) {
      emit(state.copyWith(quantity: products[index].quantity));
    }
  }

  Future<void> _onAddItem(
      AddItem event, Emitter<ClientProductDetailState> emit) async {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  Future<void> _onSubtractItem(
      SubtractItem event, Emitter<ClientProductDetailState> emit) async {
    if (state.quantity >= 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  Future<void> _onAddProductToShoppingBag(AddProductToShoppingBag event,
      Emitter<ClientProductDetailState> emit) async {
    event.product.quantity = state.quantity;
    shoppingBagUseCases.add.run(event.product);
  }

  Future<void> _onResetState(
      ResetState event, Emitter<ClientProductDetailState> emit) async {
    emit(state.copyWith(quantity: 0));
  }
}

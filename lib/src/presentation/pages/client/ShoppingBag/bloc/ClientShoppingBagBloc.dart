import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_file_gp2/src/domain/models/Product.dart';
import 'package:shopy_file_gp2/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagState.dart';

class ClientShoppingBagBloc
    extends Bloc<ClientShoppingBagEvent, ClientShoppingBagState> {
  ShoppingBagUseCases shoppingBagUseCases;

  ClientShoppingBagBloc(this.shoppingBagUseCases)
      : super(ClientShoppingBagState()) {
    on<GetShoppingBag>(_onGetShoppingBag);
    on<AddItem>(_onAddItem);
    on<SubtractItem>(_onSubtractItem);
    on<RemoveItem>(_onRemoveItem);
    on<GetTotal>(_onGetTotal);
  }

  Future<void> _onGetShoppingBag(
      GetShoppingBag event, Emitter<ClientShoppingBagState> emit) async {
    List<Product> products = await shoppingBagUseCases.getProducts.run();
    emit(state.copyWith(products: products));
    add(GetTotal());
  }

  Future<void> _onAddItem(
      AddItem event, Emitter<ClientShoppingBagState> emit) async {
    event.product.quantity = event.product.quantity! + 1;
    await shoppingBagUseCases.add.run(event.product);
    add(GetShoppingBag());
  }

  Future<void> _onSubtractItem(
      SubtractItem event, Emitter<ClientShoppingBagState> emit) async {
    if (event.product.quantity! > 1) {
      event.product.quantity = event.product.quantity! - 1;
      await shoppingBagUseCases.add.run(event.product);
      add(GetShoppingBag());
    }
  }

  Future<void> _onRemoveItem(
      RemoveItem event, Emitter<ClientShoppingBagState> emit) async {
    await shoppingBagUseCases.deleteItem.run(event.product);
    add(GetShoppingBag());
  }

  Future<void> _onGetTotal(
      GetTotal event, Emitter<ClientShoppingBagState> emit) async {
    double total = await shoppingBagUseCases.getTotal.run();
    emit(state.copyWith(total: total));
  }
}

import 'package:equatable/equatable.dart';
import 'package:shopy_file_gp2/src/domain/models/Product.dart';

abstract class ClientShoppingBagEvent extends Equatable {
  const ClientShoppingBagEvent();
  @override
  List<Object?> get props => [];
}

//trae los productos añadidos al shared prefed
class GetShoppingBag extends ClientShoppingBagEvent {
  const GetShoppingBag();
}

class AddItem extends ClientShoppingBagEvent {
  final Product product;
  const AddItem({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class SubtractItem extends ClientShoppingBagEvent {
  final Product product;
  const SubtractItem({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class RemoveItem extends ClientShoppingBagEvent {
  final Product product;
  const RemoveItem({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class GetTotal extends ClientShoppingBagEvent {
  const GetTotal();
}

import 'package:equatable/equatable.dart';
import 'package:shopy_file_gp2/src/domain/models/Product.dart';

abstract class ClientProductDetailEvent extends Equatable {
  const ClientProductDetailEvent();
  @override
  List<Object?> get props => [];
}

class ResetState extends ClientProductDetailEvent {
  const ResetState();
}

class GetProducts extends ClientProductDetailEvent {
  final Product product;
  const GetProducts({required this.product});
  @override
  List<Object?> get props => [product];
}

class AddItem extends ClientProductDetailEvent {
  const AddItem();
  @override
  List<Object?> get props => [];
}

class SubtractItem extends ClientProductDetailEvent {
  const SubtractItem();
  @override
  List<Object?> get props => [];
}

class AddProductToShoppingBag extends ClientProductDetailEvent {
  final Product product;
  const AddProductToShoppingBag({required this.product});
  @override
  List<Object?> get props => [product];
}

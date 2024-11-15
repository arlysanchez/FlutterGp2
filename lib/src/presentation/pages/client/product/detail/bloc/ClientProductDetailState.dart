import 'package:equatable/equatable.dart';

class ClientProductDetailState extends Equatable {

  final int quantity;

  ClientProductDetailState({
    this.quantity = 0
  });

  ClientProductDetailState copyWith({
    int? quantity
  }) {
    return ClientProductDetailState(quantity: quantity ?? this.quantity);
  }

  @override
  List<Object?> get props => [quantity];

}
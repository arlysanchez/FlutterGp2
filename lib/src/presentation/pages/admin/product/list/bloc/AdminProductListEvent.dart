import 'package:equatable/equatable.dart';

abstract class AdminProductListEvent extends Equatable {
  const AdminProductListEvent();
  @override
  List<Object?> get props => [];
}

class GetProductsByCategory extends AdminProductListEvent {
  final int idCategory;

  const GetProductsByCategory({required this.idCategory});

  @override
  List<Object?> get props => [idCategory];
}

class DeleteProduct extends AdminProductListEvent {
  final int id;

  const DeleteProduct({required this.id});

  @override
  List<Object?> get props => [id];
}

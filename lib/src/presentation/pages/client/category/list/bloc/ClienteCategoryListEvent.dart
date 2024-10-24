import 'package:equatable/equatable.dart';

abstract class ClienteCategoryListEvent extends Equatable {
  const ClienteCategoryListEvent();
  @override
  List<Object?> get props => [];
}

class GetCategories extends ClienteCategoryListEvent {
  const GetCategories();
}

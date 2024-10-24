import 'package:equatable/equatable.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';

class ClienteCategoryListState extends Equatable {
  final Resource? response;

  const ClienteCategoryListState({this.response});

  ClienteCategoryListState copyWith({Resource? response}) {
    return ClienteCategoryListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}

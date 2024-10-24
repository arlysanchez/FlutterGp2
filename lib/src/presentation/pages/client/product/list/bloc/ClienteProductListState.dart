import 'package:equatable/equatable.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';

class ClienteProductListState extends Equatable {
  final Resource? response;

  const ClienteProductListState({this.response});

  ClienteProductListState copyWith({Resource? response}) {
    return ClienteProductListState(response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response];
}

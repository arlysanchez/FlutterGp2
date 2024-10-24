import 'package:equatable/equatable.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';

class AdminProductListState extends Equatable {
  final Resource? response;

  const AdminProductListState({this.response});

  AdminProductListState copyWith({Resource? response}) {
    return AdminProductListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}

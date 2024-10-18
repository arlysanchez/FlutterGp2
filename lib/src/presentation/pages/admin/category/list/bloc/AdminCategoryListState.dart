import 'package:equatable/equatable.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';

class AdminCategoryListState extends Equatable{
final Resource? response;

const AdminCategoryListState({this.response});

AdminCategoryListState copyWith({
  Resource? response
})
{
 return AdminCategoryListState(response: response);
}

  @override
  List<Object?> get props => [response];

}
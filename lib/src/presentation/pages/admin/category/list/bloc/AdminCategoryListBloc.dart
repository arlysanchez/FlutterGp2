import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_file_gp2/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/category/list/bloc/AdminCategoryListState.dart';

class AdminCategoryListBloc extends Bloc<AdminCategoryListEvent, AdminCategoryListState> {
  CategoriesUseCases categoriesUseCases;

  AdminCategoryListBloc(this.categoriesUseCases): super (AdminCategoryListState()){
  on<GetCategories>(_onGetCategories);
  on<DeleteCategory>(_onDeleteCategories);
  }
Future <void>_onGetCategories(GetCategories event, Emitter<AdminCategoryListState> emit) async {
  emit(
    state.copyWith(
      response: Loading()
    )
  );
   Resource response = await categoriesUseCases.getCategories.run();
  emit(
    state.copyWith(
      response: response
    )
  );
}

Future <void>_onDeleteCategories(DeleteCategory event, Emitter<AdminCategoryListState> emit) async {
  emit(
    state.copyWith(
      response: Loading()
    )
  );
  Resource response = await categoriesUseCases.delete.run(event.id);
  emit(
    state.copyWith(
      response: response
    )
  );
}

}
import 'package:shopy_file_gp2/src/domain/useCases/categories/CreateCategoriesUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/categories/DeleteCategoriesUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/categories/GetCategoriesUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/categories/UpdateCategoriesUseCase.dart';

class CategoriesUseCases {
CreateCategoriesUseCase create;
GetCategoriesUseCase getCategories;
UpdateCategoriesUseCase update;
DeleteCategoriesUseCase delete;

CategoriesUseCases({
required this.create,
required this.getCategories,
required this.update,
required this.delete
});
}
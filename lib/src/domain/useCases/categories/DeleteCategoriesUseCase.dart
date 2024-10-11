import 'package:shopy_file_gp2/src/domain/repository/CategoriesRepository.dart';

class DeleteCategoriesUseCase {
  CategoriesRepository categoriesRepository;
  DeleteCategoriesUseCase(this.categoriesRepository);
  run(int id) => categoriesRepository.delete(id);
}
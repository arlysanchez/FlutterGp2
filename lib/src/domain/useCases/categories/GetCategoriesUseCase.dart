import 'package:shopy_file_gp2/src/domain/repository/CategoriesRepository.dart';

class GetCategoriesUseCase {
CategoriesRepository categoriesRepository;
GetCategoriesUseCase(this.categoriesRepository);
run()=> categoriesRepository.getCategories();

}
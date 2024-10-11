import 'dart:io';

import 'package:shopy_file_gp2/src/domain/models/Category.dart';
import 'package:shopy_file_gp2/src/domain/repository/CategoriesRepository.dart';

class UpdateCategoriesUseCase {
 CategoriesRepository categoriesRepository;
UpdateCategoriesUseCase(this.categoriesRepository);
run(int id, Category category, File file) => categoriesRepository.update(id, category, file);

}
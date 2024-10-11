import 'dart:io';

import 'package:shopy_file_gp2/src/domain/models/Category.dart';
import 'package:shopy_file_gp2/src/domain/repository/CategoriesRepository.dart';

class CreateCategoriesUseCase {
CategoriesRepository categoriesRepository;
CreateCategoriesUseCase(this.categoriesRepository);
run(Category category, File file) => categoriesRepository.create(category, file);
}
import 'dart:io';

import 'package:shopy_file_gp2/src/data/dataSource/remote/services/CategoriesService.dart';
import 'package:shopy_file_gp2/src/domain/models/Category.dart';
import 'package:shopy_file_gp2/src/domain/repository/CategoriesRepository.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';

class CategoriesRepositoryimpl implements CategoriesRepository {
  CategoriesService categoriesService;

  CategoriesRepositoryimpl(this.categoriesService);

  @override
  Future<Resource<Category>> create(Category category, File file) {
    return categoriesService.create(category, file);
  }

  @override
  Future<Resource<bool>> delete(int id) {
    return categoriesService.delete(id);
  }

  @override
  Future<Resource<List<Category>>> getCategories() {
    return categoriesService.getCategories();
  }

  @override
  Future<Resource<Category>> update(int id, Category category, File? file) {
    if (file == null) {
      return categoriesService.update(id, category);
    } else {
      return categoriesService.updateImage(id, category, file);
    }
  }
}

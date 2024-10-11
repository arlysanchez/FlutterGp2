import 'dart:io';

import 'package:shopy_file_gp2/src/domain/models/Category.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';

abstract class CategoriesRepository {
Future<Resource<Category>> create (Category category, File file);
Future<Resource<Category>> update (int id,Category category, File? file);
Future<Resource<List<Category>>> getCategories();
Future<Resource<bool>> delete(int id);
}
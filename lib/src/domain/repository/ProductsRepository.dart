import 'dart:io';

import 'package:shopy_file_gp2/src/domain/models/Product.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';

abstract class ProductsRepository {
  Future<Resource<Product>> create(Product product, List<File> files);
  Future<Resource<List<Product>>> getProductsByCategory(int idCategory);
  Future<Resource<Product>> update(
      int id, Product product, List<File>? files, List<int>? imagesToUpdate);
  Future<Resource<bool>> delete(int id);
}

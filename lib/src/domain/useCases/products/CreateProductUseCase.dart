import 'dart:io';

import 'package:shopy_file_gp2/src/domain/models/Product.dart';
import 'package:shopy_file_gp2/src/domain/repository/ProductsRepository.dart';

class CreateProductUseCase {
  ProductsRepository productsRepository;

  CreateProductUseCase(this.productsRepository);

  run(Product product, List<File> files) =>
      productsRepository.create(product, files);
}

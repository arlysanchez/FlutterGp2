import 'package:shopy_file_gp2/src/domain/models/Product.dart';
import 'package:shopy_file_gp2/src/domain/repository/ShoppingBagRepository.dart';

class DeleteItemShoppinBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  DeleteItemShoppinBagUseCase(this.shoppingBagRepository);

  run(Product product) => shoppingBagRepository.deleteItem(product);
}

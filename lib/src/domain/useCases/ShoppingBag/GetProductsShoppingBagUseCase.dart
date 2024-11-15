import 'package:shopy_file_gp2/src/domain/repository/ShoppingBagRepository.dart';

class GetProductsShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  GetProductsShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.getProducts();
}

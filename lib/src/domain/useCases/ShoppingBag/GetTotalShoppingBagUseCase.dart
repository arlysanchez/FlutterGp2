import 'package:shopy_file_gp2/src/domain/repository/ShoppingBagRepository.dart';

class GetTotalShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  GetTotalShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.getTotal();
}

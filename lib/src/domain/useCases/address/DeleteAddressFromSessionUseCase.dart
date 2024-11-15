import 'package:shopy_file_gp2/src/domain/repository/AddressRepository.dart';

class DeleteAddressFromSessionUseCase {
  AddressRepository addressRepository;

  DeleteAddressFromSessionUseCase(this.addressRepository);

  run() => addressRepository.deleteFromSession();
}

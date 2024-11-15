import 'package:shopy_file_gp2/src/domain/models/Address.dart';
import 'package:shopy_file_gp2/src/domain/repository/AddressRepository.dart';

class CreateAddressUseCase {
  AddressRepository addressRepository;

  CreateAddressUseCase(this.addressRepository);

  run(Address address) => addressRepository.create(address);
}

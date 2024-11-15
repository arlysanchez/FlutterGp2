import 'package:shopy_file_gp2/src/domain/repository/AddressRepository.dart';

class GetAddressSessionUseCase {
  AddressRepository addressRepository;

  GetAddressSessionUseCase(this.addressRepository);

  run() => addressRepository.getAddressSession();
}

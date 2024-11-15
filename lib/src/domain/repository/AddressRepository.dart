import 'package:shopy_file_gp2/src/domain/models/Address.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';

abstract class AddressRepository {
  Future<Resource<Address>> create(Address address);
  Future<Resource<List<Address>>> getUserAddress(int idUser);
  Future<void> saveAddressInSession(Address address);
  Future<Address?> getAddressSession();
  Future<Resource<bool>> delete(int id);
  Future<void> deleteFromSession();
}

import 'package:shopy_file_gp2/src/domain/useCases/address/CreateAddressUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/DeleteAddressFromSessionUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/DeleteAddressUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/GetAddressSessionUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/GetUserAddressUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/SaveAddressInSessionUseCase.dart';

class AddressUseCases {
  CreateAddressUseCase create;
  GetUserAddressUseCase getUserAddress;
  SaveAddressInSessionUseCase saveAddressInSession;
  GetAddressSessionUseCase getAddressSession;
  DeleteAddressUseCase delete;
  DeleteAddressFromSessionUseCase deleteFromSession;

  AddressUseCases({
    required this.create,
    required this.getUserAddress,
    required this.saveAddressInSession,
    required this.getAddressSession,
    required this.delete,
    required this.deleteFromSession,
  });
}

import 'package:equatable/equatable.dart';
import 'package:shopy_file_gp2/src/presentation/utils/BlocFormItem.dart';

abstract class ClientAddressCreateEvent extends Equatable {
  const ClientAddressCreateEvent();
  @override
  List<Object?> get props => [];
}

class ClientAddressCreateInitEvent extends ClientAddressCreateEvent {
  const ClientAddressCreateInitEvent();
}

class AddressChanged extends ClientAddressCreateEvent {
  final BlocFormItem address;
  const AddressChanged({required this.address});
  @override
  List<Object?> get props => [address];
}

class NeighborhoodChanged extends ClientAddressCreateEvent {
  final BlocFormItem neighborhood;
  const NeighborhoodChanged({required this.neighborhood});
  @override
  List<Object?> get props => [neighborhood];
}

class FormSubmit extends ClientAddressCreateEvent {
  const FormSubmit();
}

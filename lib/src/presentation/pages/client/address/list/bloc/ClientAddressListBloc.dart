import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_file_gp2/src/domain/models/Address.dart';
import 'package:shopy_file_gp2/src/domain/models/AuthResponse.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/AddressUseCases.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/list/bloc/ClientAddressListEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/list/bloc/ClientAddressListState.dart';

class ClientAddressListBloc
    extends Bloc<ClientAddressListEvent, ClientAddressListState> {
  AddressUseCases addressUseCases;
  AuthUseCases authUseCases;

  ClientAddressListBloc(this.addressUseCases, this.authUseCases)
      : super(ClientAddressListState()) {
    on<GetUserAddress>(_onGetUserAddress);
    on<ChangeRadioValue>(_onChangeRadioValue);
    on<SetAddressSession>(_onSetAddressSession);
    on<DeleteAddress>(_onDeleteAddress);
  }

  Future<void> _onGetUserAddress(
      GetUserAddress event, Emitter<ClientAddressListState> emit) async {
    AuthResponse? authResponse = await authUseCases.getUserSession.run();
    if (authResponse != null) {
      emit(state.copyWith(response: Loading()));
      Resource response =
          await addressUseCases.getUserAddress.run(authResponse.user.id!);
      emit(state.copyWith(response: response));
    }
  }

  Future<void> _onChangeRadioValue(
      ChangeRadioValue event, Emitter<ClientAddressListState> emit) async {
    emit(state.copyWith(radioValue: event.radioValue));
    await addressUseCases.saveAddressInSession.run(event.address);
  }

  Future<void> _onSetAddressSession(
      SetAddressSession event, Emitter<ClientAddressListState> emit) async {
    Address? addressSession = await addressUseCases.getAddressSession.run();
    print('Adress session:${addressSession?.toJson()}');
    if (addressSession != null) {
      int index = event.addressList
          .indexWhere((address) => address.id == addressSession.id);
      if (index != -1) {
        // YA HEMOS SELECCIONADO UNA DIRECCION Y ESTA GUARDADA EN SESION
        emit(state.copyWith(radioValue: index));
      }
    }
  }

  Future<void> _onDeleteAddress(
      DeleteAddress event, Emitter<ClientAddressListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await addressUseCases.delete.run(event.id);
    emit(state.copyWith(response: response));
    Address? addressSession = await addressUseCases.getAddressSession.run();
    if (addressSession != null) {
      if (addressSession.id == event.id) {
        await addressUseCases.deleteFromSession.run();
        emit(state.copyWith(radioValue: null));
      }
    }
  }
}

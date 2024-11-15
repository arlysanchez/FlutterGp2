import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_file_gp2/src/domain/models/AuthResponse.dart';
import 'package:shopy_file_gp2/src/domain/useCases/address/AddressUseCases.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/create/bloc/ClientAddressCreateEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/create/bloc/ClientAddressCreateState.dart';
import 'package:shopy_file_gp2/src/presentation/utils/BlocFormItem.dart';

class ClientAddressCreateBloc
    extends Bloc<ClientAddressCreateEvent, ClientAddressCreateState> {
  AddressUseCases addressUseCases;
  AuthUseCases authUseCases;

  ClientAddressCreateBloc(this.addressUseCases, this.authUseCases)
      : super(ClientAddressCreateState()) {
    on<ClientAddressCreateInitEvent>(_onClientAddressCreateInitEvent);
    on<AddressChanged>(_onAddressChanged);
    on<NeighborhoodChanged>(_onNeighborhoodChanged);
    on<FormSubmit>(_onFormSubmit);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onClientAddressCreateInitEvent(
      ClientAddressCreateInitEvent event,
      Emitter<ClientAddressCreateState> emit) async {
    AuthResponse? authResponse = await authUseCases.getUserSession.run();
    emit(state.copyWith(formKey: formKey));
    if (authResponse != null) {
      emit(state.copyWith(formKey: formKey, idUser: authResponse.user.id));
    }
  }

  Future<void> _onAddressChanged(
      AddressChanged event, Emitter<ClientAddressCreateState> emit) async {
    emit(state.copyWith(
        address: BlocFormItem(
            value: event.address.value,
            error:
                event.address.value.isNotEmpty ? null : 'Ingresa la direccion'),
        formKey: formKey));
  }

  Future<void> _onNeighborhoodChanged(
      NeighborhoodChanged event, Emitter<ClientAddressCreateState> emit) async {
    emit(state.copyWith(
        neighborhood: BlocFormItem(
            value: event.neighborhood.value,
            error: event.neighborhood.value.isNotEmpty
                ? null
                : 'Ingresa el barrio'),
        formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<ClientAddressCreateState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    Resource response = await addressUseCases.create.run(state.toAddress());
    emit(state.copyWith(response: response, formKey: formKey));
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shopy_file_gp2/src/domain/models/Address.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';
import 'package:shopy_file_gp2/src/presentation/utils/BlocFormItem.dart';

class ClientAddressCreateState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final BlocFormItem address;
  final BlocFormItem neighborhood;
  final Resource? response;
  final int idUser;

  const ClientAddressCreateState(
      {this.address = const BlocFormItem(error: 'Ingresa la direccion'),
      this.neighborhood = const BlocFormItem(error: 'Ingresa el barrio'),
      this.formKey,
      this.response,
      this.idUser = 0});

  toAddress() => Address(
      address: address.value, neighborhood: neighborhood.value, idUser: idUser);

  ClientAddressCreateState copyWith(
      {BlocFormItem? address,
      BlocFormItem? neighborhood,
      GlobalKey<FormState>? formKey,
      Resource? response,
      int? idUser}) {
    return ClientAddressCreateState(
        address: address ?? this.address,
        neighborhood: neighborhood ?? this.neighborhood,
        formKey: formKey,
        response: response,
        idUser: idUser ?? this.idUser);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [address, neighborhood, response, idUser];
}

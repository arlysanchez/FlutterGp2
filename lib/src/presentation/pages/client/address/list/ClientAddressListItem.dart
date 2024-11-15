import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopy_file_gp2/src/domain/models/Address.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/list/bloc/ClientAddressListBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/list/bloc/ClientAddressListEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/address/list/bloc/ClientAddressListState.dart';

class ClientAddressListItem extends StatelessWidget {
  ClientAddressListBloc? bloc;
  ClientAddressListState state;
  Address address;
  int index;

  ClientAddressListItem(this.bloc, this.state, this.address, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio(
            value: index,
            groupValue: state.radioValue,
            onChanged: (value) {
              bloc?.add(ChangeRadioValue(radioValue: value!, address: address));
            },
          ),
          trailing: IconButton(
              onPressed: () {
                bloc?.add(DeleteAddress(id: address.id!));
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              )),
          title: Text(
            address.address,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            address.neighborhood,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          color: Colors.grey[300],
          indent: 30,
          endIndent: 30,
        )
      ],
    );
  }
}

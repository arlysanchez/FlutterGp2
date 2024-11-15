import 'package:flutter/material.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagState.dart';
import 'package:shopy_file_gp2/src/presentation/widget/DefaultButton.dart';

class ClientShoppingBagBottomBar extends StatelessWidget {
  ClientShoppingBagState state;

  ClientShoppingBagBottomBar(this.state);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.grey[200],
      child: Column(
        children: [
          Divider(
            color: Colors.grey[300],
            height: 0,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'TOTAL: \S/.${state.total}',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 180,
                child: DefaultButton(
                    text: 'CONFIRMAR ORDEN',
                    onPressed: () {
                      Navigator.pushNamed(context, 'client/address/list');
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}

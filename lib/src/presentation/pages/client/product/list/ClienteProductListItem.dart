import 'package:flutter/material.dart';
import 'package:shopy_file_gp2/src/domain/models/Product.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/product/list/bloc/ClienteProductListBloc.dart';

class ClientProductListItem extends StatelessWidget {
  ClienteProductListBloc? bloc;
  Product? product;

  ClientProductListItem(this.bloc, this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'client/product/detail',
            arguments: product);
      },
      child: ListTile(
        trailing: product != null
            ? Container(
                width: 70,
                child: product!.image1!.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        placeholder: 'assets/img/no-image.png',
                        image: product!.image1!,
                        fit: BoxFit.contain,
                        fadeInDuration: Duration(seconds: 1),
                      )
                    : Container(),
              )
            : Container(),
        title: Text(product?.name ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(product?.description ?? ''),
            SizedBox(height: 5),
            Text(
              '\$ ${product?.price.toString() ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        // contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
      ),
    );
  }
}

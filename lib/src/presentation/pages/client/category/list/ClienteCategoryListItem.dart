import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopy_file_gp2/src/domain/models/Category.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/category/list/bloc/ClienteCategoryListBloc.dart';

class ClientCategoryListItem extends StatelessWidget {
  ClienteCategoryListBloc? bloc;
  Category? category;

  ClientCategoryListItem(this.bloc, this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'client/product/list',
              arguments: category);
        },
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                category != null
                    ? Container(
                        width: double.infinity,
                        height: 200,
                        child: category!.image!.isNotEmpty
                            ? FadeInImage.assetNetwork(
                                placeholder: 'assets/img/no-image.png',
                                image: category!.image!,
                                fit: BoxFit.contain,
                                fadeInDuration: Duration(seconds: 1),
                              )
                            : Container(),
                      )
                    : Container(),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 15),
                  child: Text(
                    category?.name ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 7, left: 15, bottom: 15),
                  child: Text(
                    category?.description ?? '',
                    style: TextStyle(color: Colors.grey[600], fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

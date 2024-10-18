import 'package:flutter/material.dart';
import 'package:shopy_file_gp2/src/domain/models/Category.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';

class AdminCategoryListItem extends StatelessWidget {
  AdminCategoryListBloc? bloc;
  Category? category;

  AdminCategoryListItem(this.bloc, this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, 'admin/product/list', arguments: category);
      },
      child: ListTile(
        leading: category != null
            ? Container(
                width: 70,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/img/no-image.png',
                  image: category!.image!,
                  fit: BoxFit.contain,
                  fadeInDuration: Duration(seconds: 1),
                ),
              )
            : Container(),
        title: Text(category?.name ?? ''),
        subtitle: Text(category?.description ?? ''),
        // contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
        trailing: Wrap(
          direction: Axis.horizontal,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'admin/category/update',
                      arguments: category);
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  bloc?.add(DeleteCategory(id: category!.id!));
                },
                icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}

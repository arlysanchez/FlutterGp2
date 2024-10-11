import 'package:flutter/material.dart';
class DefaultIconBack extends StatelessWidget {
  final double left;
 final double top;

  DefaultIconBack({
    required this.left,
    required this.top,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: left, top: top),
      child: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 30,
          color: Colors.white,
        )),
    );
  }
}
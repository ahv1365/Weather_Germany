import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  const BoxContainer({Key key, this.child, this.margin}) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(18.0),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 10),
            blurRadius: 15,
             spreadRadius: 10,
             
          ),
        ],
      ),
    );
  }
}

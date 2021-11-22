import 'package:flutter/material.dart';

class BottomBorderedContainer extends StatelessWidget {
  final Widget child;

  BottomBorderedContainer({required final Widget child}) : this.child = child;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
        ),
        child: child);
  }
}

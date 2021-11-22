import 'package:flutter/material.dart';

class WrapTextWithPadding extends StatelessWidget {
  final Widget widget;

  WrapTextWithPadding({required final Widget child}) : this.widget = child;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(4), child: widget);
  }
}

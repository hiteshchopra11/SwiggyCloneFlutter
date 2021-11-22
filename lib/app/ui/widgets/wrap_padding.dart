import 'package:flutter/material.dart';

class WrapWithPadding extends StatelessWidget {
  final Widget child;

  WrapWithPadding({required final Widget widget}) : this.child = widget;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0), child: child);
  }
}

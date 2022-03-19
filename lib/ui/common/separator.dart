import 'package:flutter/material.dart';

class HorizontalSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 18.0,
        color: Theme.of(context).colorScheme.tertiary);
  }
}

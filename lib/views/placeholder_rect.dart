import 'package:flutter/material.dart';

class PlaceholderRect extends StatelessWidget {
  final double height;
  final double width;

  PlaceholderRect({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Theme.of(context).primaryColorDark,
      duration: Duration(milliseconds: 300),
      width: this.width,
      height: this.height,
    );
  }
}

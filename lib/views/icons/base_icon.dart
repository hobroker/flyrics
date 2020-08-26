import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseIcon extends StatelessWidget {
  final String name;
  final Color color;

  BaseIcon({
    Key key,
    @required this.name,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      name,
      color: color,
    );
  }
}

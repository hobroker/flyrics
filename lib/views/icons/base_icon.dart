import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseIcon extends StatelessWidget {
  final String name;
  final Color color;
  final double size;

  BaseIcon({
    Key key,
    this.size,
    this.name,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      name,
      color: color,
      width: size,
      height: size,
    );
  }
}

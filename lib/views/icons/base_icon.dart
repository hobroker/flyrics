import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseIcon extends StatelessWidget {
  final String name;
  final Color color;
  final double width;
  final double height;

  BaseIcon({
    Key key,
    @required this.name,
    @required this.color,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      name,
      color: color,
      width: width,
      height: height,
    );
  }
}

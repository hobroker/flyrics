import 'package:flutter/material.dart';
import 'package:flyrics/constants/asset_constants.dart';
import 'package:flyrics/views/icons/base_icon.dart';

class GeniusIcon extends StatelessWidget {
  final double width;
  final double height;

  const GeniusIcon({Key key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseIcon(
      color: Color(0xffFFFE7D),
      name: AssetConstants.geniusIcon,
      width: height,
      height: height,
    );
  }
}

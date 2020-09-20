import 'package:flutter/material.dart';
import 'package:flyrics/constants/asset.dart';
import 'package:flyrics/views/icons/base_icon.dart';

class GeniusIcon extends BaseIcon {
  @override
  final String name = AssetConstants.geniusIcon;

  @override
  final Color color = Color(0xffFFFE7D);

  GeniusIcon({double size}) : super(size: size);
}

import 'package:flutter/material.dart';
import 'package:flyrics/utils/assets_path.dart';
import 'package:flyrics/views/icons/base_icon.dart';

class GeniusIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseIcon(
      color: Color(0xffFFFE7D),
      name: AssetsPath.geniusIcon,
    );
  }
}

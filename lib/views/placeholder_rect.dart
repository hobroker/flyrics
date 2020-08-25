import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:shimmer/shimmer.dart';

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
    return Shimmer.fromColors(
      baseColor: UI.primaryDarkColor,
      highlightColor: UI.primaryColor,
      enabled: true,
      child: Container(
        width: this.width,
        height: this.height,
        color: UI.primaryColor,
      ),
    );
  }
}

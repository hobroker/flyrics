import 'package:flutter/material.dart';
import 'package:flyrics/constants/asset_constants.dart';
import 'package:flyrics/views/icons/base_icon.dart';

class NoResultsIcon extends BaseIcon {
  @override
  final String name = AssetConstants.noResults;

  NoResultsIcon({
    double size,
    Color color,
  }) : super(
          size: size,
          color: color,
        );
}

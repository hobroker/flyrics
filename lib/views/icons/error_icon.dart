import 'package:flutter/material.dart';
import 'package:flyrics/constants/asset_constants.dart';
import 'package:flyrics/views/icons/base_icon.dart';

class LyricsErrorIcon extends BaseIcon {
  @override
  final String name = AssetConstants.lyricsError;

  LyricsErrorIcon({
    double size,
    Color color,
  }) : super(
          size: size,
          color: color,
        );
}

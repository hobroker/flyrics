import 'package:flutter/material.dart';
import 'package:flyrics/constants/sizing.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/placeholder_rect.dart';

class ArtworkPlaceholder extends StatelessWidget {
  getSize(context) {
    return randomSize(Sizing(context).headerHeight * 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: PlaceholderRect(
        height: this.getSize(context),
        width: this.getSize(context),
      ),
    );
  }
}

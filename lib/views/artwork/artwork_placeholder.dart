import 'package:flutter/material.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track_store.dart';
import 'package:flyrics/utils/o.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class ArtworkPlaceholder extends StatelessWidget {
  final _track = I<TrackStore>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var height = constraints.maxHeight;
        var size = height * 0.8;
        var margin = (height - size) / 2;

        return Container(
          margin: EdgeInsets.symmetric(horizontal: margin),
          child: O(
            () => PlaceholderShimmer(
              height: size,
              width: size,
              isAnimated: _track.artwork.isLoading,
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flyrics/containers/header_wrapper.dart';
import 'package:flyrics/views/artwork/artwork_placeholder.dart';
import 'package:flyrics/views/track/track_placeholder.dart';
import 'package:flyrics/views/track/track_wrapper.dart';

class HeaderPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HeaderWrapper(
      children: [
        TrackWrapper(
          child: TrackPlaceholder(
            isAnimated: false,
          ),
        ),
        ArtworkPlaceholder(isAnimated: false),
      ],
    );
  }
}

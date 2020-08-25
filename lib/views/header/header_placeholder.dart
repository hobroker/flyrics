import 'package:flutter/material.dart';
import 'package:flyrics/utils/debug.dart';
import 'package:flyrics/views/artwork/artwork_placeholder.dart';
import 'package:flyrics/views/header/header_wrapper.dart';
import 'package:flyrics/views/track/track_placeholder.dart';
import 'package:flyrics/views/track/track_wrapper.dart';

class HeaderPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        debug('constraints.maxHeight', constraints.maxHeight);
        debug('constraints.minHeight', constraints.minHeight);
        return HeaderWrapper(
          children: [
            TrackWrapper(
              child: TrackPlaceholder(
                isAnimated: false,
              ),
            ),
            ArtworkPlaceholder(
              isAnimated: false,
              height: constraints.maxHeight,
            ),
          ],
        );
      },
    );
  }
}

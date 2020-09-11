import 'package:flutter/material.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track.dart';
import 'package:flyrics/views/artwork/artwork_placeholder.dart';
import 'package:flyrics/views/artwork/artwork_screen.dart';

class Artwork extends StatelessWidget {
  final _track = I<TrackStore>();

  @override
  Widget build(BuildContext context) {
    return O.branch(
      () => _track.artwork.hasBytes,
      () => ArtworkScreen(),
      () => ArtworkPlaceholder(),
    );
  }
}

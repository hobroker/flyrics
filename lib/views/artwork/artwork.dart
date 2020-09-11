import 'package:flutter/material.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/states/track_store.dart';
import 'package:flyrics/utils/o.dart';
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

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/injection.dart';
import 'package:flyrics/views/artwork/artwork_placeholder.dart';
import 'package:flyrics/views/artwork/artwork_screen.dart';

class Artwork extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _track = useTrackStore();
    return O.branch(
      () => _track.artwork.hasBytes,
      () => ArtworkScreen(),
      () => ArtworkPlaceholder(),
    );
  }
}

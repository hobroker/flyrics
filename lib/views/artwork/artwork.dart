import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/views/artwork/artwork_placeholder.dart';
import 'package:flyrics/views/artwork/artwork_screen.dart';

class Artwork extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _artwork = useArtworkStore();

    return O.branch(
      () => _artwork.canShow,
      () => ArtworkScreen(),
      () => ArtworkPlaceholder(),
    );
  }
}

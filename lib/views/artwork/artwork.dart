import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';
import 'package:flyrics/views/artwork/artwork_missing.dart';
import 'package:flyrics/views/artwork/artwork_placeholder.dart';
import 'package:flyrics/views/artwork/artwork_screen.dart';

class Artwork extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final artwork = useArtworkStore();

    return O.statusBranch(
      () => artwork.status,
      placeholder: () => ArtworkPlaceholder(animated: false),
      loading: () => ArtworkPlaceholder(animated: true),
      error: () => ArtworkMissing(),
      empty: () => ArtworkMissing(),
      success: () => ArtworkScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';
import 'package:flyrics/views/artwork/artwork_placeholder.dart';
import 'package:flyrics/views/artwork/artwork_screen.dart';
import 'package:flyrics/views/artwork/artwork_missing.dart';

class Artwork extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _artwork = useArtworkStore();

    return O.statusBranch(
      () => _artwork.status,
      placeholder: () => ArtworkPlaceholder(animated: false),
      loading: () => ArtworkPlaceholder(animated: true),
      error: () => ArtworkMissing(),
      empty: () => ArtworkMissing(),
      success: () => ArtworkScreen(),
    );
  }
}

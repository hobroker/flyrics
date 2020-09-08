import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/store.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/views/artwork/artwork_placeholder.dart';
import 'package:flyrics/views/artwork/artwork_screen.dart';

class Artwork extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isLoading = useSelector(isArtworkLoading);
    final hasBytes = useSelector(activeTrackHasArtworkBytes);

    return !isLoading && hasBytes ? ArtworkScreen() : ArtworkPlaceholder();
  }
}

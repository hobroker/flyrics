import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/views/artwork/artwork_placeholder.dart';
import 'package:flyrics/views/artwork/artwork_screen.dart';

class Artwork extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final artworkBytes =
        useSelector<AppState, List<int>>(getTrackArtworkAsBytes);
    final isLoading = useSelector<AppState, bool>(isArtworkLoading);
    final hasBytes = useSelector<AppState, bool>(activeTrackHasArtworkBytes);
    final fadeColor = useSelector<AppState, Color>(resolvedDominantColor);

    if (!isLoading && hasBytes) {
      return ArtworkScreen(
        bytes: artworkBytes,
        fadeColor: fadeColor,
      );
    }

    return ArtworkPlaceholder(
      isAnimated: isLoading,
    );
  }
}

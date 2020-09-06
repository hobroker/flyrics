import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/views/track/track_placeholder.dart';
import 'package:flyrics/views/track/track_screen.dart';

class TrackDetails extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isLoading = useSelector<AppState, bool>(isTrackLoading);
    final trackExists = useSelector<AppState, bool>(hasTrack);
    final name = useSelector<AppState, String>(getTrackName);
    final artist = useSelector<AppState, String>(getTrackArtist);
    final textColor = useSelector<AppState, Color>(resolveArtworkTextColor);

    if (trackExists) {
      return TrackScreen(
        name: name,
        artist: artist,
        textColor: textColor,
      );
    }

    return TrackPlaceholder(
      isAnimated: isLoading,
    );
  }
}

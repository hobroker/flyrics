import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/views/text_ellipsis.dart';
import 'package:flyrics/views/track/track_name.dart';
import 'package:flyrics/views/track/track_placeholder.dart';

class TrackScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final trackExists = useSelector<AppState, bool>(hasTrack);
    final name = useSelector<AppState, String>(getTrackName);
    final artist = useSelector<AppState, String>(getTrackArtist);
    final textColor = useSelector<AppState, Color>(resolveArtworkTextColor);

    if (!trackExists) {
      return TrackPlaceholder();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: TrackName(
            name: name,
            textColor: textColor,
          ),
        ),
        SizedBox(height: UX.spacingUnit),
        TextEllipsis(
          text: artist,
          style: TextStyle(
            color: textColor,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

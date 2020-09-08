import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/hooks/store.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/views/text_ellipsis.dart';
import 'package:flyrics/views/track/track_name.dart';
import 'package:flyrics/views/track/track_placeholder.dart';

class TrackScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final trackExists = useSelector(hasTrack);
    final name = useSelector(getTrackName);
    final artist = useSelector(getTrackArtist);
    final textColor = useSelector(resolveArtworkTextColor);

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

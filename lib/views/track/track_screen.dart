import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/injection.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/views/text_ellipsis.dart';
import 'package:flyrics/views/track/track_name.dart';

class TrackScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _track = useTrackStore();

    return O(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: TrackName(
              name: _track.track.name,
              textColor: _track.artwork.textColor,
            ),
          ),
          SizedBox(height: I<UX>().spacingUnit),
          TextEllipsis(
            text: _track.track.artist,
            style: TextStyle(
              color: _track.artwork.textColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

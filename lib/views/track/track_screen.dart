import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/views/text_ellipsis.dart';
import 'package:flyrics/views/track/track_name.dart';

class TrackScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _color = useColorStore();
    final _track = useTrackStore();
    final ux = useUX();

    return O(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: TrackName(
              text: _track.track.name,
              textColor: _color.textColor,
            ),
          ),
          SizedBox(height: ux.spacingUnit),
          TextEllipsis(
            text: _track.track.artist,
            style: TextStyle(
              color: _color.textColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

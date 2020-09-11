import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track.dart';
import 'package:flyrics/views/text_ellipsis.dart';
import 'package:flyrics/views/track/track_name.dart';

class TrackScreen extends StatelessWidget {
  final _track = I<TrackStore>();

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: UX.spacingUnit),
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

import 'package:flutter/material.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/views/track/track_placeholder.dart';
import 'package:flyrics/views/track/track_screen.dart';
import 'package:flyrics/views/track/track_wrapper.dart';

class TrackDetails extends StatelessWidget {
  final _track = I<TrackStore>();

  @override
  Widget build(BuildContext context) {
    return TrackWrapper(
      child: O.branch(
        () => _track.hasTrack,
        () => TrackScreen(),
        () => TrackPlaceholder(),
      ),
    );
  }
}

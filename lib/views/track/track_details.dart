import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/modules/mobx/o.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/views/track/track_placeholder.dart';
import 'package:flyrics/views/track/track_screen.dart';
import 'package:flyrics/views/track/track_wrapper.dart';

class TrackDetails extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _track = useTrackStore();

    return TrackWrapper(
      child: O.branch(
        () => _track.hasTrack,
        () => TrackScreen(),
        () => TrackPlaceholder(),
      ),
    );
  }
}

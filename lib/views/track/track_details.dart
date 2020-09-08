import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/store.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/views/track/track_placeholder.dart';
import 'package:flyrics/views/track/track_screen.dart';
import 'package:flyrics/views/track/track_wrapper.dart';

class TrackDetails extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final trackExists = useSelector(hasTrack);

    return TrackWrapper(
      child: trackExists ? TrackScreen() : TrackPlaceholder(),
    );
  }
}

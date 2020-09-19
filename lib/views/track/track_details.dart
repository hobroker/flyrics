import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/views/track/track_artist.dart';
import 'package:flyrics/views/track/track_name.dart';
import 'package:flyrics/views/track/track_wrapper.dart';

class TrackDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TrackWrapper(
      name: TrackName(),
      artist: TrackArtist(),
    );
  }
}

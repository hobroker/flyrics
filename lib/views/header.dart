import 'package:flutter/material.dart';
import 'package:flyrics/views/artwork/artwork.dart';
import 'package:flyrics/views/track/track_screen.dart';
import 'package:flyrics/views/track/track_wrapper.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TrackWrapper(
        child: TrackScreen(),
      ),
      Artwork()
    ]);
  }
}

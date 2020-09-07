import 'package:flutter/material.dart';
import 'package:flyrics/views/artwork/artwork.dart';
import 'package:flyrics/views/track/track_details.dart';
import 'package:flyrics/views/track/track_wrapper.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TrackWrapper(
          child: TrackDetails(),
        ),
        Artwork(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flyrics/views/artwork/artwork.dart';
import 'package:flyrics/views/primary_container.dart';
import 'package:flyrics/views/track/track_details.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Row(children: [TrackDetails(), Artwork()]),
    );
  }
}

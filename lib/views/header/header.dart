import 'package:flutter/material.dart';
import 'package:flyrics/containers/artwork.dart';
import 'package:flyrics/containers/header_wrapper.dart';
import 'package:flyrics/containers/track_details.dart';
import 'package:flyrics/views/track/track_wrapper.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var headerHeight = constraints.maxHeight;

        return HeaderWrapper(
          children: [
            TrackWrapper(
              child: TrackDetails(),
            ),
            Artwork(
              height: headerHeight,
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flyrics/constants/sizing.dart';
import 'package:flyrics/containers/artwork.dart';
import 'package:flyrics/containers/track_details.dart';

class Header extends StatelessWidget {
  final Color backgroundColor;

  Header({this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizing(context).headerWidth,
      height: Sizing(context).headerHeight,
      child: Container(
        color: this.backgroundColor,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 8.0),
                child: TrackDetails(),
              ),
            ),
            Artwork(),
          ],
        ),
      ),
    );
  }
}

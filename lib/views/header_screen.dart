import 'package:flutter/material.dart';
import 'package:flyrics/constants/sizing.dart';
import 'package:flyrics/containers/artwork.dart';
import 'package:flyrics/containers/track_details.dart';

class HeaderScreen extends StatelessWidget {
  final Color backgroundColor;

  HeaderScreen({this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizing(context).headerWidth,
      height: Sizing(context).headerHeight,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: this.backgroundColor,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 8.0),
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

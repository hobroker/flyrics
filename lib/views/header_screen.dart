import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:flyrics/containers/artwork.dart';
import 'package:flyrics/containers/track_details.dart';

class HeaderScreen extends StatelessWidget {
  final Color backgroundColor;

  HeaderScreen({
    Key key,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UI(context).headerWidth,
      height: UI(context).headerHeight,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: this.backgroundColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
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

import 'package:flutter/material.dart';
import 'package:flyrics/constants/sizing.dart';
import 'package:flyrics/containers/artwork.dart';
import 'package:flyrics/containers/track_details.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizing(context).headerWidth,
      height: Sizing(context).headerHeight,
      child: Container(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 8.0),
        child: Row(
          children: [
            TrackDetails(),
            Spacer(),
            Artwork(),
          ],
        ),
      ),
    );
  }
}

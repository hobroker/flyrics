import 'package:flutter/material.dart';
import 'package:flyrics/constants/sizing.dart';
import 'package:flyrics/containers/song_details.dart';

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
        child: Row(
          children: [
            SongDetails(),
          ],
        ),
      ),
    );
  }
}

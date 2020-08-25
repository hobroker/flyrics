import 'package:flutter/material.dart';
import 'package:flyrics/constants/sizing.dart';
import 'package:flyrics/views/placeholder_line.dart';

class TrackDetailsPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlaceholderLine(
            height: 20.0,
            maxWidth: Sizing(context).appWidth * 0.75,
          ),
          Spacer(),
          PlaceholderLine(
            height: 16,
            maxWidth: Sizing(context).appWidth * 0.5,
          ),
        ],
      ),
    );
  }
}

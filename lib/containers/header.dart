import 'package:flutter/material.dart';
import 'package:flyrics/containers/artwork.dart';
import 'package:flyrics/containers/track_details.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/views/header_wrapper.dart';
import 'package:flyrics/views/track/wrapper.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: getArtworkDominantColor,
      builder: (context, backgroundColor) {
        return HeaderWrapperScreen(
          backgroundColor: backgroundColor,
          children: [
            TrackDetailsWrapper(
              child: TrackDetails(),
            ),
            Artwork(),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flyrics/containers/lyrics.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/views/content_wrapper.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: (state) => getArtworkDominantColor(state),
      builder: (context, backgroundColor) {
        return ContentWrapper(
          backgroundColor: backgroundColor,
          children: [Lyrics()],
        );
      },
    );
  }
}

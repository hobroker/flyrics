import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/views/header_screen.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: getArtworkDominantColor,
      builder: (context, backgroundColor) {
        return HeaderScreen(
          backgroundColor: backgroundColor,
        );
      },
    );
  }
}

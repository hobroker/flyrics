import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/views/header/header_wrapper_screen.dart';

class HeaderWrapper extends StatelessWidget {
  final List<Widget> children;

  HeaderWrapper({
    Key key,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Connector.state(
      converter: resolvedDominantColor,
      builder: (context, backgroundColor) => HeaderWrapperScreen(
        backgroundColor: backgroundColor,
        children: children,
      ),
    );
  }
}

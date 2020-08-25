import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GeniusRedirectScreen extends StatelessWidget {
  final String url;
  final Color iconColor;

  GeniusRedirectScreen({
    Key key,
    @required this.url,
    @required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Opacity(
        opacity: .9,
        child: Container(
          child: SvgPicture.asset(
            'assets/icons/genius.svg',
            color: iconColor,
            semanticsLabel: 'A red up arrow',
          ),
        ),
      ),
    );
  }
}

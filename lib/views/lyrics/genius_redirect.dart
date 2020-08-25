import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flyrics/api/api.dart';

class GeniusRedirectScreen extends StatelessWidget {
  final String url;
  final Color iconColor;

  GeniusRedirectScreen({
    Key key,
    @required this.url,
    @required this.iconColor,
  }) : super(key: key);

  void onPressed() async {
    await api.url.openUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Opacity(
        opacity: .9,
        child: Container(
          child: IconButton(
            padding: EdgeInsets.all(0),
            constraints: BoxConstraints(maxWidth: 16, maxHeight: 16),
            icon: SvgPicture.asset(
              'assets/icons/genius.svg',
              color: Colors.green,
              semanticsLabel: 'A red up arrow',
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}

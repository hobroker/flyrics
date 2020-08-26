import 'package:flutter/material.dart';
import 'package:flyrics/containers/genius_redirect.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GeniusRedirect(),
      ],
    );
  }
}

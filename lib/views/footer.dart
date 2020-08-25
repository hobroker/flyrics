import 'package:flutter/material.dart';
import 'package:flyrics/containers/genius_redirect.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GeniusRedirect(),
        ],
      ),
    );
  }
}

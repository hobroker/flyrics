import 'package:flutter/material.dart';
import 'package:flyrics/containers/content.dart';
import 'package:flyrics/containers/header.dart';

class LayoutScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        Content(),
      ],
    );
  }
}

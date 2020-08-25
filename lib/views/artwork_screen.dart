import 'package:flutter/material.dart';

class ArtworkScreen extends StatelessWidget {
  final String src;

  ArtworkScreen({this.src});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(this.src),
    );
  }
}

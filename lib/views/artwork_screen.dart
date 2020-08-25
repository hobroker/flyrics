import 'package:flutter/material.dart';

class ArtworkScreen extends StatelessWidget {
  final List<int> bytes;

  ArtworkScreen({
    @required this.bytes,
  });

  @override
  Widget build(BuildContext context) {
    return Image.memory(this.bytes);
  }
}

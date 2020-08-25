import 'package:flutter/material.dart';
import 'package:flyrics/views/artwork_placeholder.dart';

class ArtworkScreen extends StatelessWidget {
  final List<int> bytes;

  ArtworkScreen({
    this.bytes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          this.bytes == null ? ArtworkPlaceholder() : Image.memory(this.bytes),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track.dart';
import 'package:flyrics/utils/o.dart';
import 'package:flyrics/views/artwork/artwork_gradient.dart';

class ArtworkScreen extends StatelessWidget {
  final _track = I<TrackStore>();

  void _showImageDialog(context, child) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: O(
        () {
          final child = Stack(
            children: [
              Image.memory(
                _track.artwork.bytes,
                fit: BoxFit.fill,
              ),
              ArtworkGradient(
                fadeColor: _track.artwork.dominantColor,
              ),
            ],
          );

          return GestureDetector(
            onTap: () => _showImageDialog(context, child.children.first),
            child: child,
          );
        },
      ),
    );
  }
}

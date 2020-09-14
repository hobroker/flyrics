import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/injection.dart';
import 'package:flyrics/views/artwork/artwork_gradient.dart';

class ArtworkScreen extends HookWidget {
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
    final _track = useTrackStore();

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
                color: _track.artwork.dominantColor,
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

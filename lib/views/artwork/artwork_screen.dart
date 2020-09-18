import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/injections.dart';
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
    final _artwork = useArtworkStore();
    final _color = useColorStore();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: O(
        () {
          final image = Image.memory(
            _artwork.bytes,
            fit: BoxFit.fill,
          );

          return GestureDetector(
            onTap: () => _showImageDialog(context, image),
            child: Stack(
              children: [
                image,
                ArtworkGradient(
                  color: _color.dominantColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

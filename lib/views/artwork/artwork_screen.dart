import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';
import 'package:flyrics/views/artwork/artwork_gradient.dart';

class ArtworkScreen extends HookWidget {
  void _showImageDialog(context, child) => showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(child: child),
      );

  @override
  Widget build(BuildContext context) {
    final artwork = useArtworkStore();
    final ux = useUX();

    return O(
      () {
        final image = Image.memory(artwork.data, fit: BoxFit.fill);

        return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => _showImageDialog(context, image),
              child: Stack(
                children: [
                  image,
                  ArtworkGradient(color: ux.primaryColor),
                ],
              ),
            ));
      },
    );
  }
}

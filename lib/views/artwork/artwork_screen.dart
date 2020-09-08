import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/store.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/views/artwork/artwork_gradient.dart';

class ArtworkScreen extends HookWidget {
  Widget _getImageWidget(bytes) => Image.memory(
        bytes,
        fit: BoxFit.fill,
      );

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
    final bytes = useSelector(getTrackArtworkAsBytes);
    final fadeColor = useSelector(resolvedDominantColor);
    final _imageWidget = _getImageWidget(bytes);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _showImageDialog(context, _imageWidget),
        child: Stack(
          children: [
            _imageWidget,
            ArtworkGradient(
              fadeColor: fadeColor,
            ),
          ],
        ),
      ),
    );
  }
}

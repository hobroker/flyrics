import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flyrics/controllers/track_controller.dart';
import 'package:flyrics/views/artwork/artwork_gradient.dart';
import 'package:get/get.dart';

class ArtworkScreen extends StatelessWidget {
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

  final c = Get.find<TrackController>();

  @override
  Widget build(BuildContext context) {
    final _imageWidget = _getImageWidget(c.artworkBytes);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _showImageDialog(context, _imageWidget),
        child: Stack(
          children: [
            _imageWidget,
            Obx(
              () => ArtworkGradient(
                fadeColor: c.artworkDominantColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

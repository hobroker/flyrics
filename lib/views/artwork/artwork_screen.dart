import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flyrics/views/artwork/artwork_gradient.dart';

class ArtworkScreen extends StatelessWidget {
  final List<int> bytes;
  final Color fadeColor;

  ArtworkScreen({
    Key key,
    @required this.bytes,
    this.fadeColor,
  }) : super(key: key);

  Widget get _imageWidget => Image.memory(
        bytes,
        fit: BoxFit.fill,
      );

  void _showImageDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: _imageWidget,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _showImageDialog(context),
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

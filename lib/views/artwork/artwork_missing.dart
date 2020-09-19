import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';

class ArtworkMissing extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _colors = useColorStore();

    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;
      var size = height * 0.8;

      return Container(
        width: height,
        height: height,
        child: O(
          () => Icon(
            Icons.broken_image_outlined,
            color: _colors.textColor,
            size: size,
          ),
        ),
      );
    });
  }
}

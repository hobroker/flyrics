import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/modules/mobx/o.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class ArtworkPlaceholder extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _artwork = useArtworkStore();

    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;
      final size = height * 0.8;
      final margin = (height - size) / 2;

      return Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        child: O(
          () => PlaceholderShimmer(
            height: size,
            width: size,
            isAnimated: _artwork.isLoading,
          ),
        ),
      );
    });
  }
}

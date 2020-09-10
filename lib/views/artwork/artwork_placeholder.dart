import 'package:flutter/material.dart';
import 'package:flyrics/controllers/track_controller.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';
import 'package:get/get.dart';

class ArtworkPlaceholder extends StatelessWidget {
  final c = Get.find<TrackController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return LayoutBuilder(
          builder: (context, constraints) {
            var height = constraints.maxHeight;
            var size = height * randomBetween(0.7, 0.85);
            var margin = (height - size) / 2;

            return Container(
              margin: EdgeInsets.symmetric(horizontal: margin),
              child: PlaceholderShimmer(
                height: size,
                width: size,
                isAnimated: c.isArtwokLoading,
              ),
            );
          },
        );
      },
    );
  }
}

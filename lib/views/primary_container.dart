import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/controllers/track_controller.dart';
import 'package:get/get.dart';

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  final c = Get.find<TrackController>();

  PrimaryContainer({
    Key key,
    @required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        width: width,
        height: height,
        duration: UX.transitionDuration,
        decoration: BoxDecoration(
          color: c.artworkDominantColor,
        ),
        child: child,
      ),
    );
  }
}

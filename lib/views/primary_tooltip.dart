import 'package:flutter/material.dart';
import 'package:flyrics/controllers/track_controller.dart';
import 'package:get/get.dart';

class PrimaryTooltip extends StatelessWidget {
  final String message;
  final Widget child;

  PrimaryTooltip({
    Key key,
    @required this.message,
    @required this.child,
  }) : super(key: key);

  final c = Get.find<TrackController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Tooltip(
        message: message,
        child: child,
        verticalOffset: 16,
        textStyle: TextStyle(
          color: c.artworkDominantColor,
          height: 1,
        ),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: c.artworkTextColor,
        ),
      ),
    );
  }
}

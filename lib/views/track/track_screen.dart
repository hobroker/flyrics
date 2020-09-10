import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/controllers/track_controller.dart';
import 'package:flyrics/views/text_ellipsis.dart';
import 'package:flyrics/views/track/track_name.dart';
import 'package:flyrics/views/track/track_placeholder.dart';
import 'package:get/get.dart';

class TrackScreen extends HookWidget {
  final track = Get.find<TrackController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final color = track.artworkTextColor;

      return track.isLoading
          ? TrackPlaceholder()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: TrackName(
                    name: track.current.name,
                    textColor: color,
                  ),
                ),
                SizedBox(height: UX.spacingUnit),
                TextEllipsis(
                  text: track.current.artist,
                  style: TextStyle(
                    color: color,
                    fontSize: 15,
                  ),
                ),
              ],
            );
    });
  }
}

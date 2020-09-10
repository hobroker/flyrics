import 'package:flutter/material.dart';
import 'package:flyrics/controllers/track_controller.dart';
import 'package:flyrics/views/artwork/artwork_placeholder.dart';
import 'package:flyrics/views/artwork/artwork_screen.dart';
import 'package:get/get.dart';

class Artwork extends StatelessWidget {
  final c = Get.find<TrackController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => c.isArtwokLoading || !c.artworkHasBytes
        ? ArtworkPlaceholder()
        : ArtworkScreen());
  }
}

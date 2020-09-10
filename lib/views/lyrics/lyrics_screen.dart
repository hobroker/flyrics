import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/controllers/track_controller.dart';
import 'package:flyrics/hooks/store.dart';
import 'package:flyrics/selectors/lyrics.dart';
import 'package:get/get.dart';

class LyricsScreen extends HookWidget {
  final c = Get.find<TrackController>();

  @override
  Widget build(BuildContext context) {
    final text = useSelector(getLyricsText);

    return Container(
      child: Obx(
        () => SelectableText(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 12,
            color: c.artworkTextColor,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';
import 'package:flyrics/views/text_with_placeholder.dart';
import 'package:flyrics/views/track/track_wrapper.dart';

class TrackDetails extends HookWidget {
  TextStyle get nameTextStyle =>
      TextStyle(fontSize: 15, fontWeight: FontWeight.w500, height: 1);

  TextStyle get artistTextStyle => TextStyle(fontSize: 14, height: 1);

  @override
  Widget build(BuildContext context) {
    final track = useTrackStore();
    final ux = useUX();

    return O(
      () => TrackWrapper(
        children: [
          PlaceholderMarqueeText(
            text: track.track?.name,
            isLoading: track.isLoading,
            style: nameTextStyle.copyWith(color: ux.textColor),
            widthRange: [0.7, 0.9],
          ),
          PlaceholderMarqueeText(
            text: track.track?.artist,
            isLoading: track.isLoading,
            style: artistTextStyle.copyWith(color: ux.textColor),
            widthRange: [0.5, 0.6],
          ),
        ],
      ),
    );
  }
}

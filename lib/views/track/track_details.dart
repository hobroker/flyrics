import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/text_with_placeholder.dart';
import 'package:flyrics/views/track/track_wrapper.dart';

class TrackDetails extends HookWidget {
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
            style: ux.header.nameTextStyle.copyWith(color: ux.textColor),
            placeholderWidthRatio: randomBetween(0.7, 0.9),
          ),
          PlaceholderMarqueeText(
            text: track.track?.artist,
            isLoading: track.isLoading,
            style: ux.header.artistTextStyle.copyWith(color: ux.textColor),
            placeholderWidthRatio: randomBetween(0.5, 0.6),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/marquee_text.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class TrackArtist extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final track = useTrackStore();
    final ux = useUX();

    return O.branch(
      () => track.hasTrack,
      () => MarqueeText(
        text: track.track.artist,
        style: TextStyle(
          color: ux.textColor,
          fontSize: 14,
        ),
      ),
      () => PlaceholderShimmer(
        height: 14,
        isAnimated: track.isLoading,
        widthRatio: randomBetween(0.5, 0.6),
      ),
    );
  }
}

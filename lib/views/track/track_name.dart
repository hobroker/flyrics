import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';
import 'package:flyrics/utils/random.dart';
import 'package:flyrics/views/marquee_text.dart';
import 'package:flyrics/views/placeholder_shimmer.dart';

class TrackName extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _track = useTrackStore();
    final _color = useColorStore();

    return O.branch(
      () => _track.hasTrack,
      () => MarqueeText(
        text: _track.track.name,
        style: TextStyle(
          color: _color.textColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      () => PlaceholderShimmer(
        height: 15.0,
        isAnimated: _track.isLoading,
        widthRatio: randomBetween(0.7, 0.9),
      ),
    );
  }
}

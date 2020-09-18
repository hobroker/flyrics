import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/views/marquee_text.dart';

class TrackScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _color = useColorStore();
    final _track = useTrackStore();
    final ux = useUX();

    return O(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MarqueeText(
            text: _track.track.name,
            style: TextStyle(
              color: _color.textColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: ux.spacingUnit),
          MarqueeText(
            text: _track.track.artist,
            style: TextStyle(
              color: _color.textColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

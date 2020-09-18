import 'package:flutter/material.dart';
import 'package:flyrics/utils/painter.dart';
import 'package:flyrics/views/hover_builder.dart';
import 'package:marquee/marquee.dart';

class MarqueeText extends StatelessWidget {
  final String text;
  final TextStyle style;

  MarqueeText({
    Key key,
    @required this.text,
    this.style,
  }) : super(key: key);

  TextPainter _textPainter(constraints) => paintText(
      text: text, style: style, constraints: constraints, maxLines: 1);

  Widget get _marqueeText => HoverBuilder(
        initialState: false,
        toggleTo: true,
        builder: (context, isHover) {
          return Marquee(
            key: Key('$text$isHover'),
            text: text,
            style: style,
            blankSpace: 50,
            numberOfRounds: 1,
            startAfter: Duration(seconds: 1),
            pauseAfterRound: const Duration(seconds: 1),
            fadingEdgeEndFraction: 0.1,
            showFadingOnlyWhenScrolling: false,
          );
        },
      );

  Widget get _simpleText => Text(text, style: style);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = _textPainter(constraints);
        final child =
            textPainter.didExceedMaxLines ? _marqueeText : _simpleText;

        return Container(
          height: textPainter.height,
          child: child,
        );
      },
    );
  }
}

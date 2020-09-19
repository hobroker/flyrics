import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/modules/mobx/o.dart';
import 'package:flyrics/hooks/injections.dart';

class LyricsInfoBox extends HookWidget {
  final Widget icon;
  final String text;

  LyricsInfoBox({
    @required this.icon,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final _colors = useColorStore();
    final ux = useUX();

    return FractionallySizedBox(
      widthFactor: .6,
      child: Container(
        child: Column(
          children: [
            SizedBox(height: ux.lyricsStatusIconSize),
            icon,
            SizedBox(height: ux.spacingUnit * 2),
            O(
              () => Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _colors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

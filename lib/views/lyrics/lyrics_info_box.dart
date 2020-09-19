import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';

class LyricsInfoBox extends HookWidget {
  final String text;

  LyricsInfoBox({
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
            SizedBox(height: ux.infoIconMaxSize),
            O(
              () => Icon(
                Icons.error_outline,
                color: _colors.textColor,
                size: ux.infoIconMaxSize,
              ),
            ),
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

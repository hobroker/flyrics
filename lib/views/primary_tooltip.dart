import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/store.dart';
import 'package:flyrics/selectors/artwork.dart';

class PrimaryTooltip extends HookWidget {
  final String message;
  final Widget child;

  const PrimaryTooltip({
    Key key,
    @required this.message,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = useSelector(resolveArtworkTextColor);
    final textColor = useSelector(resolvedDominantColor);

    return Tooltip(
      message: message,
      child: child,
      verticalOffset: 16,
      textStyle: TextStyle(
        color: textColor,
        height: 1,
      ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
    );
  }
}

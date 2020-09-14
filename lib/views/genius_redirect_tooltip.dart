import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/translate.dart';
import 'package:flyrics/views/primary_tooltip.dart';

class GeniusRedirectTooltip extends HookWidget {
  final Widget child;

  const GeniusRedirectTooltip({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tooltipMessage = useTranslation('lyrics.open_in_browser');

    return PrimaryTooltip(
      message: tooltipMessage,
      child: child,
    );
  }
}

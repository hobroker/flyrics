import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/hooks/use_theme.dart';
import 'package:flyrics/modules/injection.dart';

class PageWrapper extends HookWidget {
  final Widget child;

  const PageWrapper({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();

    return Injection(
      provider: (_) => UX(theme: theme),
      child: child,
    );
  }
}

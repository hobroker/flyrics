import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/use_theme.dart';
import 'package:flyrics/modules/injection.dart';
import 'package:flyrics/services/ux.dart';

class UXInjection extends HookWidget {
  final Widget child;

  const UXInjection(this.child, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();

    return Injection(
      provider: (_) => UX(theme: theme),
      child: child,
    );
  }
}

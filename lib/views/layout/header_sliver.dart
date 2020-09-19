import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/views/primary_container.dart';
import 'package:flyrics/views/sliver_header_delegate.dart';

class HeaderSliver extends HookWidget {
  final Widget child;

  HeaderSliver({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ux = useUX();

    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        minHeight: ux.headerMinHeight,
        maxHeight: ux.headerMaxHeight,
        child: PrimaryContainer(
          child: child,
        ),
      ),
    );
  }
}

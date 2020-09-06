import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/views/primary_container.dart';
import 'package:flyrics/views/sliver_header_delegate.dart';

class LayoutHeader extends StatelessWidget {
  final Widget child;
  final double minHeight = 50;
  final double maxHeight = 75;

  LayoutHeader({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        minHeight: minHeight,
        maxHeight: maxHeight,
        child: PrimaryContainer(
          child: child,
        ),
      ),
    );
  }
}

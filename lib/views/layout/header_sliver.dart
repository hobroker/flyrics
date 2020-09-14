import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/views/primary_container.dart';
import 'package:flyrics/views/sliver_header_delegate.dart';

class HeaderSliver extends StatelessWidget {
  final Widget child;
  HeaderSliver({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        minHeight: I<UX>().headerMinHeight,
        maxHeight: I<UX>().headerMaxHeight,
        child: PrimaryContainer(
          child: child,
        ),
      ),
    );
  }
}

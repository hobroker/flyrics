import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/views/empty_widget.dart';
import 'package:flyrics/views/layout/body_sliver.dart';
import 'package:flyrics/views/layout/footer_sliver.dart';
import 'package:flyrics/views/layout/header_sliver.dart';

class LayoutWrapper extends HookWidget {
  final Widget header;
  final Widget body;
  final Widget footer;

  LayoutWrapper({
    Key key,
    @required this.header,
    @required this.body,
    this.footer = const EmptyWidget(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ux = useUX();

    return Container(
      child: CupertinoScrollbar(
        thicknessWhileDragging: ux.spacingUnit * 2,
        thickness: ux.spacingUnit,
        child: CustomScrollView(
          slivers: [
            HeaderSliver(child: header),
            BodySliver(child: body),
            FooterSliver(child: footer),
          ],
        ),
      ),
    );
  }
}

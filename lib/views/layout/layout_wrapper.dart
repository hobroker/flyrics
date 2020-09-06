import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/views/empty_widget.dart';
import 'package:flyrics/views/layout/body_sliver.dart';
import 'package:flyrics/views/layout/footer_sliver.dart';
import 'package:flyrics/views/layout/header_sliver.dart';

class LayoutWrapper extends StatelessWidget {
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
    return Container(
      padding: EdgeInsets.only(right: UX.spacingUnit),
      child: CupertinoScrollbar(
        thicknessWhileDragging: UX.spacingUnit * 2,
        thickness: UX.spacingUnit,
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

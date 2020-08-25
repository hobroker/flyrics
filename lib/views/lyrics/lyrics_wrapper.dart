import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:flyrics/views/empty_widget.dart';

class LyricsWrapper extends StatelessWidget {
  final Widget header;
  final Widget body;
  final Widget footer;

  LyricsWrapper({
    Key key,
    @required this.header,
    @required this.body,
    this.footer = const EmptyWidget(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              collapsedHeight: 50.0,
              toolbarHeight: 0,
              expandedHeight: 80.0,
              backgroundColor: Colors.transparent,
              flexibleSpace: header,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => Container(
                  child: body,
                  padding: EdgeInsets.only(top: 8, left: 8, right: 4),
                ),
                childCount: 1,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: UI(context).footerHeight),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: footer,
        )
      ],
    );
  }
}

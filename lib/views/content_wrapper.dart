import 'package:flutter/material.dart';
import 'package:flyrics/containers/dynamic_container.dart';
import 'package:flyrics/utils/sizing.dart';

class ContentWrapper extends StatelessWidget {
  final List<Widget> children;
  final Color backgroundColor;

  ContentWrapper({
    Key key,
    @required this.children,
    @required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = UI(context).appHeight - UI(context).headerHeight;

    return Expanded(
      child: DynamicContainer(
        child: Container(
          padding: EdgeInsets.all(8),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: height,
              minHeight: height,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

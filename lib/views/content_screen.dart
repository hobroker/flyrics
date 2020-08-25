import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

class ContentScreen extends StatelessWidget {
  final Color backgroundColor;

  ContentScreen({
    Key key,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = UI(context).appWidth;
    var height = UI(context).appHeight - UI(context).headerHeight;

    return Expanded(
      child: AnimatedContainer(
        alignment: Alignment(0, 0),
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: this.backgroundColor,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height, minHeight: height),
          child: SingleChildScrollView(
            child: Container(
              width: width,
              color: Colors.green,
              child: Column(
                children: [
                  Text('one'),
                  Text('one'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

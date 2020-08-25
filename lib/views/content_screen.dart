import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

class ContentScreen extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;

  ContentScreen({
    Key key,
    @required this.backgroundColor,
    @required this.textColor,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = UI(context).appHeight - UI(context).headerHeight;

    return Expanded(
      child: AnimatedContainer(
        padding: EdgeInsets.all(8),
        alignment: Alignment(0, 0),
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height,
            minHeight: height,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    color: textColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

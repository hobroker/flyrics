import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

class LyricsWrapper extends StatelessWidget {
  final Widget child;
  final Widget footer;

  LyricsWrapper({
    Key key,
    @required this.child,
    this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = UI(context).appHeight - UI(context).headerHeight;

    return Flexible(
      child: Container(
        padding: EdgeInsets.only(top: 8, left: 8, right: 8),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height,
            minHeight: height,
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    child,
                    SizedBox(height: 8),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: footer,
              )
            ],
          ),
        ),
      ),
    );
  }
}

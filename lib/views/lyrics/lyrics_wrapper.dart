import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Expanded(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 8, left: 8, right: 4),
            child: CupertinoScrollbar(
              thickness: 4,
              thicknessWhileDragging: 8,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    child,
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: footer,
          )
        ],
      ),
    );
  }
}

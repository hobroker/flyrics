import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/utils/list.dart';

class TrackWrapper extends HookWidget {
  final List<Widget> children;

  TrackWrapper({
    Key key,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ux = useUX();

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: ux.spacingUnit,
          horizontal: ux.spacingUnit * 2,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: insertBetween<Widget>(
              children,
              SizedBox(height: ux.spacingUnit),
            ),
          ),
        ),
      ),
    );
  }
}

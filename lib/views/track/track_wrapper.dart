import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';

class TrackWrapper extends HookWidget {
  final Widget name;
  final Widget artist;

  TrackWrapper({
    Key key,
    @required this.name,
    @required this.artist,
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
            children: [
              name,
              SizedBox(height: ux.spacingUnit),
              artist,
            ],
          ),
        ),
      ),
    );
  }
}

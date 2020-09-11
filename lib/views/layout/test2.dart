import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/states/test_store.dart';

class Test2 extends StatelessWidget {
  final _track = I<TestStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            RaisedButton(
              onPressed: _track.increment2,
              child: Text('test 2 -${_track.count2}-'),
            )
          ],
        );
      },
    );
  }
}

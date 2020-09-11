import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/states/test_store.dart';

class Test1 extends StatelessWidget {
  final _track = I<TestStore>();

  @override
  Widget build(BuildContext context) {
    print('build1');

    return Observer(
      builder: (_) => Column(
        children: [
          RaisedButton(
            onPressed: _track.increment1,
            child: Text('test 1 -${_track.count1}-${_track.count2}-'),
          )
        ],
      ),
    );
  }
}

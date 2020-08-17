import 'package:flutter/material.dart';

class SongDetailsScreen extends StatelessWidget {
  final int counter;
  final Function() onIncrement;
  final Function(int) onAdd;

  SongDetailsScreen({
    Key key,
    @required this.counter,
    @required this.onIncrement,
    @required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${this.counter}'),
        RaisedButton(
          onPressed: this.onIncrement,
          child: const Text('+1'),
        ),
        RaisedButton(
          onPressed: () {
            this.onAdd(6);
          },
          child: const Text('+6'),
        ),
      ],
    );
  }
}

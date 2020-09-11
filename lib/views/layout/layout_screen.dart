import 'package:flutter/material.dart';
import 'package:flyrics/views/footer.dart';
import 'package:flyrics/views/header.dart';
import 'package:flyrics/views/layout/layout_wrapper.dart';
import 'package:flyrics/views/layout/test1.dart';
import 'package:flyrics/views/layout/test2.dart';

class LayoutScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutWrapper(
      header: Header(),
      body: Column(
        children: [
          Test1(),
          Test2(),
        ],
      ),
      footer: Footer(),
    );
  }
}

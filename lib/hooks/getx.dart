import 'dart:async';

import 'package:flutter/material.dart' show BuildContext, Container;
import 'package:flutter_hooks/flutter_hooks.dart' show use, Hook, HookState;
import 'package:get/get.dart';

T useController<T extends GetxController>() => use(_UseGetX<T>());

class _UseGetX<T extends GetxController> extends Hook<T> {
  final bool autoRemove;

  _UseGetX({
    this.autoRemove = false,
  });

  @override
  _UseGetImplXState<T> createState() => _UseGetImplXState<T>();
}

class _UseGetImplXState<T extends GetxController>
    extends HookState<T, _UseGetX<T>> {
  GetxController controller;
  RxInterface _observer;
  StreamSubscription subs;

  _UseGetImplXState() {
    _observer = Rx();
  }

  @override
  void initHook() {
    super.initHook();
    subs = _observer.subject.stream.listen((data) => setState(() {}));
    controller = Get.find<T>();
    controller.addListener((fn) => {setState(() {})});
  }

  @override
  void dispose() {
    super.dispose();
    controller = null;
    subs.cancel();
    _observer.close();
    if (hook.autoRemove && GetInstance().isRegistered<T>()) {
      GetInstance().delete<T>();
    }
  }

  @override
  T build(BuildContext context) {
    var result;
    GetX<T>(builder: (_) {
      result = _;
      return Container();
    });

    return controller;
  }
}

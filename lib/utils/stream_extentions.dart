import 'dart:async';
import 'package:stream_transform/src/from_handlers.dart';

extension OfType<T> on Stream<T> {
  Stream<T> ofType<ActionType>() {
    return transform(fromHandlers(
      handleData: (element, sink) {
        if (element is ActionType) {
          sink.add(element);
        }
      },
      handleDone: (sink) {
        sink.close();
      },
      handleError: (error, stackTrace, sink) {
        sink.addError(error, stackTrace);
      },
    ));
  }
}

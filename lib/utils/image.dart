import 'dart:async';
import 'dart:ui' as ui;

Future<ui.Image> bytesToImage(List<int> img) async {
  var completer = Completer<ui.Image>();
  ui.decodeImageFromList(img, (ui.Image img) {
    return completer.complete(img);
  });
  return completer.future;
}

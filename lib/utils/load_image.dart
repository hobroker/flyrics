import 'dart:async';
import 'dart:ui' as ui;

Future<ui.Image> loadImage(List<int> img) async {
  var completer = Completer();
  ui.decodeImageFromList(img, (ui.Image img) {
    return completer.complete(img);
  });
  return completer.future;
}

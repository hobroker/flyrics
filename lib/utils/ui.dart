import 'dart:async';
import 'dart:ui' as ui;

loadImage(List<int> img) async {
  final Completer<ui.Image> completer = new Completer();
  ui.decodeImageFromList(img, (ui.Image img) {
    return completer.complete(img);
  });
  return completer.future;
}

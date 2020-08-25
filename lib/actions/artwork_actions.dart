import 'dart:ui';

class FetchArtworkBytesStartAction {
  final String id;
  final String url;

  FetchArtworkBytesStartAction(this.url, {this.id});

  @override
  String toString() => '${FetchArtworkBytesStartAction}($url, id: $id)';
}

class FetchArtworkBytesSuccessAction {
  final String id;
  final List<int> bytes;

  FetchArtworkBytesSuccessAction(this.bytes, {this.id});

  @override
  String toString() => '${FetchArtworkBytesSuccessAction}([...], id: $id)';
}

class SetArtworkAsMissingAction {
  @override
  String toString() => '${SetArtworkAsMissingAction}()';
}

class ResetArtworkColorsAction {
  @override
  String toString() => '${ResetArtworkColorsAction}()';
}

class SetArtworkColorsAction {
  final String id;
  final Color textColor;
  final List<Color> colors;

  SetArtworkColorsAction({
    this.textColor,
    this.colors,
    this.id,
  });

  @override
  String toString() => '${SetArtworkColorsAction}($textColor, <Color>[...], $id)';
}

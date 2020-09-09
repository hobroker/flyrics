import 'package:flyrics/models/artwork_model.dart';
import 'package:flyrics/modules/store/action.dart';

class FetchArtworkBytesStartAction with ReduxAction {
  final String id;
  final String url;

  FetchArtworkBytesStartAction(this.url, {this.id});

  @override
  List get args => [id, url];
}

class FetchArtworkBytesSuccessAction with ReduxAction {
  final String id;
  final List<int> bytes;

  FetchArtworkBytesSuccessAction(this.bytes, {this.id});

  @override
  List get args => ['[...]', id];
}

class SetArtworkAsMissingAction with ReduxAction {}

class ResetArtworkColorsAction with ReduxAction {}

class SetArtworkColorsAction with ReduxAction {
  final String id;
  final ArtworkModel artwork;

  SetArtworkColorsAction(this.artwork, {this.id});

  @override
  List get args => [artwork, id];
}

import 'dart:ui';

import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/modules/color_extension.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/utils/image.dart';
import 'package:mobx/mobx.dart';

part 'artwork.g.dart';

class ArtworkStore = ArtworkStoreBase with _$ArtworkStore;

abstract class ArtworkStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  Object error;

  @observable
  List<int> bytes;

  @observable
  List<Color> colors;

  ArtworkStoreBase() {
    resetColors();
    reaction<List<int>>((_) => bytes, (bytes) => fetchColors(bytes));
  }

  @action
  Future fetchBytes(String url) async {
    isLoading = true;
    try {
      bytes = await I<SpotifyService>().getImageBytes(url);
    } catch (err) {
      error = err;
    }
    isLoading = false;
  }

  @action
  Future fetchColors(List<int> bytes) async {
    if (bytes.isEmpty) {
      return;
    }

    try {
      colors = await findImageColors(bytes);
    } catch (err) {
      resetColors();
    }
  }

  @action
  void resetColors() {
    colors = [I<UX>().primaryColor, I<UX>().primaryDarkColor];
  }

  @computed
  bool get hasBytes => !isLoading && bytes != null;

  @computed
  Color get dominantColor => colors.first.autoDarkened;

  @computed
  Color get textColor => dominantColor.opposite;

  @computed
  Color get placeholderBgColor => colors[1];

  @computed
  Color get placeholderFgColor => colors.first;
}

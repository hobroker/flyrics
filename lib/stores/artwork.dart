import 'dart:ui';

import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/modules/color_extension.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:flyrics/utils/image.dart';
import 'package:mobx/mobx.dart';

part 'artwork.g.dart';

class ArtworkStore = ArtworkStoreBase with _$ArtworkStore;

abstract class ArtworkStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  List<int> bytes;

  @observable
  List<Color> colors;

  ArtworkStoreBase() {
    when((_) => isNotNull(bytes), fetchColors);
  }

  @action
  Future fetchBytes(String url) async {
    isLoading = true;
    bytes = await I<SpotifyService>().getImageBytes(url);
    isLoading = false;
  }

  @action
  Future fetchColors() async {
    colors = await findImageColors(bytes);
  }

  @computed
  bool get hasBytes => !isLoading && bytes != null;

  @computed
  Color get dominantColor => colors?.elementAt(0) != null
      ? colors.first.autoDarkened
      : UX.primaryColor;

  @computed
  Color get textColor => dominantColor.opposite ?? UX.textColor;

  @computed
  Color get placeholderBgColor => colors?.elementAt(1) ?? UX.primaryDarkColor;

  @computed
  Color get placeholderFgColor => colors?.elementAt(0) ?? UX.primaryColor;
}

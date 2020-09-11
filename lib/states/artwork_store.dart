import 'dart:ui';

import 'package:flyrics/api/api.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/modules/color_extension.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/utils/image.dart';
import 'package:mobx/mobx.dart';

part 'artwork_store.g.dart';

class ArtworkStore = ArtworkStoreBase with _$ArtworkStore;

abstract class ArtworkStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  List<int> bytes;

  @observable
  List<Color> colors;

  @action
  Future fetchBytes(String url) async {
    isLoading = true;
    bytes = await I<Api>().spotify.getImageBytes(url);
    isLoading = false;

    await fetchColors();
  }

  @action
  Future fetchColors() async {
    colors = await findImageColors(bytes);
  }

  @computed
  Color get dominantColor => colors.first.autoDarkened ?? UX.primaryColor;

  @computed
  Color get textColor => dominantColor.opposite ?? UX.textColor;

  @computed
  Color get placeholderBgColor => colors[1] ?? UX.primaryDarkColor;

  @computed
  Color get placeholderFgColor => colors.first ?? UX.primaryColor;
}

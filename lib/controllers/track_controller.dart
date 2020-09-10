import 'dart:ui';

import 'package:flyrics/api/api.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/models/artwork_model.dart';
import 'package:flyrics/models/track.dart';
import 'package:flyrics/modules/color_extension.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/utils/image.dart';
import 'package:get/get.dart';

class TrackController extends GetxController {
  final _isLoading = Rx<bool>(false);
  final _isArtwokLoading = Rx<bool>(false);
  final _track = Rx<Track>();
  final _artwork = Rx<ArtworkModel>(ArtworkModel());

  Track get current => _track.value;

  List<int> get artworkBytes => _artwork.value.bytes;

  bool get artworkHasBytes => artworkBytes != null;

  Color get artworkDominantColor =>
      _artwork.value.dominantColor ?? UX.primaryColor;

  Color get artworkTextColor => _artwork.value.textColor ?? UX.textColor;

  bool get isLoading => _isLoading.value;

  bool get isArtwokLoading => _isArtwokLoading.value;

  bool get hasTrack => current != null;

  @override
  void onInit() {
    refreshCurrentTrack();
    ever(_track, (track) async {
      await fetchArtworkBytes(track.artwork);
      await refreshColors();
    });
  }

  Future refreshCurrentTrack() async {
    _isLoading(true);

    final track = await I<Api>().spotify.fetchCurrentTrack();
    _track(track);

    _isLoading(false);
  }

  void fetchArtworkBytes(String url) async {
    _isArtwokLoading(true);

    final bytes = await I<Api>().spotify.fetchImageBytes(url);
    _artwork(_artwork.value.rebuild((b) => b..bytes = bytes));

    _isArtwokLoading(false);
  }

  void refreshColors() async {
    final colors = await findImageColors(artworkBytes);
    final dominantColor = colors.first.autoDarkened;

    _artwork(_artwork.value.rebuild((b) => b
      ..colors = colors
      ..dominantColor = dominantColor
      ..textColor = dominantColor.opposite));
  }
}

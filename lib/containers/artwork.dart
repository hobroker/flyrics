import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/views/artwork_placeholder.dart';
import 'package:flyrics/views/artwork_screen.dart';
import 'package:flyrics/models/app_state.dart';

class Artwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) {
        return _ViewModel(
          artworkBytes: getTrackArtworkAsBytes(store.state),
          isArtworkLoaded: isArtworkLoaded(store.state),
          fadeColor: getArtworkBackgroundColor(store.state),
        );
      },
      builder: (context, vm) {
        return vm.isArtworkLoaded
            ? ArtworkScreen(
                bytes: vm.artworkBytes,
                fadeColor: vm.fadeColor ?? UI.primaryColor,
              )
            : ArtworkPlaceholder();
      },
    );
  }
}

class _ViewModel {
  final bool isArtworkLoaded;
  final List<int> artworkBytes;
  final Color fadeColor;

  _ViewModel({
    this.artworkBytes,
    this.isArtworkLoaded,
    this.fadeColor,
  });
}

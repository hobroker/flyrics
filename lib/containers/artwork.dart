import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
          artworkURL: getTrackArtwork(store.state),
          hasTrack: hasTrack(store.state),
        );
      },
      builder: (context, vm) {
        return vm.hasTrack
            ? ArtworkScreen(
                src: vm.artworkURL,
              )
            : ArtworkPlaceholder();
      },
    );
  }
}

class _ViewModel {
  final String artworkURL;
  final bool hasTrack;

  _ViewModel({
    this.artworkURL,
    this.hasTrack,
  });
}

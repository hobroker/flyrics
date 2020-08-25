import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flyrics/models/track.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/views/track_details_placeholder.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/views/track_details_screen.dart';
import 'package:flyrics/models/app_state.dart';

class TrackDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) {
        return _ViewModel(
          name: getTrackName(store.state),
          artist: getTrackArtist(store.state),
          hasTrack: hasTrack(store.state),
        );
      },
      builder: (context, vm) {
        return !vm.hasTrack
            ? TrackDetailsPlaceholder()
            : TrackDetailsScreen(
                name: vm.name,
                artist: vm.artist,
              );
      },
    );
  }
}

class _ViewModel {
  final String name;
  final String artist;
  final bool hasTrack;

  _ViewModel({
    this.name,
    this.artist,
    this.hasTrack,
  });
}

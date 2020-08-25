import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
          hasTrack: hasTrack(store.state),
          name: getTrackName(store.state),
          artist: getTrackArtist(store.state),
          textColor: getArtworkTextColor(store.state),
        );
      },
      builder: (context, vm) {
        return vm.hasTrack
            ? TrackDetailsScreen(
                name: vm.name,
                artist: vm.artist,
                textColor: vm.textColor,
              )
            : TrackDetailsPlaceholder();
      },
    );
  }
}

class _ViewModel {
  String name;
  String artist;
  final bool hasTrack;
  final Color textColor;

  _ViewModel({
    this.name,
    this.artist,
    this.hasTrack,
    this.textColor,
  }) {
    this.name = this.name?.replaceAll("", "\u{200B}");
    this.artist = this.artist?.replaceAll("", "\u{200B}");
  }
}

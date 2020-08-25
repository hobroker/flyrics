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
          track: getTrack(store.state),
          isPlaying: store.state.isRunning,
        );
      },
      builder: (context, vm) {
        return vm.track == null
            ? TrackDetailsPlaceholder()
            : TrackDetailsScreen(
                track: vm.track,
              );
      },
    );
  }
}

class _ViewModel {
  final Track track;
  final bool isPlaying;

  _ViewModel({
    this.track,
    this.isPlaying,
  });
}

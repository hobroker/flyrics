import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/views/track/track_details_placeholder.dart';
import 'package:flyrics/views/track/track_details_screen.dart';

class TrackDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: (state) => _ViewModel(
        hasTrack: hasTrack(state),
        name: getTrackName(state),
        artist: getTrackArtist(state),
        textColor: getArtworkTextColor(state),
      ),
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
    name = name?.replaceAll('', '\u{200B}');
    artist = artist?.replaceAll('', '\u{200B}');
  }

  @override
  bool operator ==(other) {
    return other.name == name &&
        other.artist == artist &&
        other.hasTrack == hasTrack &&
        other.textColor == textColor;
  }

  @override
  int get hashCode => super.hashCode;
}

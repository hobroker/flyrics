import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/utils/conditional.dart';
import 'package:flyrics/utils/ux.dart';
import 'package:flyrics/views/track/track_placeholder.dart';
import 'package:flyrics/views/track/track_screen.dart';

class TrackDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector.state(
      converter: (state) => _ViewModel(
        isLoading: isTrackLoading(state),
        hasTrack: hasTrack(state),
        name: getTrackName(state),
        artist: getTrackArtist(state),
        textColor: getArtworkTextColor(state) ?? UX.textColor,
      ),
      builder: (context, vm) {
        return Conditional.single(
          when: !vm.isLoading && vm.hasTrack,
          render: () => TrackScreen(
            name: vm.name,
            artist: vm.artist,
            textColor: vm.textColor,
          ),
          fallback: () => TrackPlaceholder(
            isAnimated: vm.isLoading,
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final String name;
  final String artist;
  final bool isLoading;
  final bool hasTrack;
  final Color textColor;

  _ViewModel({
    this.name,
    this.artist,
    this.isLoading,
    this.hasTrack,
    this.textColor,
  });

  @override
  bool operator ==(other) {
    return other.name == name &&
        other.artist == artist &&
        other.hasTrack == hasTrack &&
        other.isLoading == isLoading &&
        other.textColor == textColor;
  }

  @override
  int get hashCode => super.hashCode;
}

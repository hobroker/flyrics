import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/views/artwork/artwork_placeholder.dart';
import 'package:flyrics/views/artwork/artwork_screen.dart';

class Artwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: (state) => _ViewModel(
        artworkBytes: getTrackArtworkAsBytes(state),
        isLoading: isArtworkLoading(state),
        isArtworkMissing: isArtworkMissing(state),
        fadeColor: getArtworkDominantColor(state),
      ),
      builder: (context, vm) {
        return vm.isLoading
            ? ArtworkPlaceholder(
                isAnimated: !vm.isArtworkMissing,
              )
            : ArtworkScreen(
                bytes: vm.artworkBytes,
                fadeColor: vm.fadeColor,
              );
      },
    );
  }
}

@immutable
class _ViewModel {
  final bool isLoading;
  final bool isArtworkMissing;
  final List<int> artworkBytes;
  final Color fadeColor;

  _ViewModel({
    @required this.artworkBytes,
    @required this.isLoading,
    @required this.fadeColor,
    @required this.isArtworkMissing,
  });

  @override
  bool operator ==(other) {
    return other.isLoading == isLoading &&
        other.artworkBytes == artworkBytes &&
        other.isArtworkMissing == isArtworkMissing &&
        other.fadeColor == fadeColor;
  }

  @override
  int get hashCode => super.hashCode;
}

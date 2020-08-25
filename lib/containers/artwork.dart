import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/views/empty_widget.dart';
import 'package:flyrics/views/artwork/placeholder.dart';
import 'package:flyrics/views/artwork/screen.dart';

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
        if (vm.isArtworkMissing) {
          return EmptyWidget();
        }

        if (vm.isLoading) {
          return ArtworkPlaceholder();
        }

        return ArtworkScreen(
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

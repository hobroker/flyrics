import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/utils/conditional.dart';
import 'package:flyrics/views/artwork/artwork_placeholder.dart';
import 'package:flyrics/views/artwork/artwork_screen.dart';

class Artwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: (state) => _ViewModel(
        artworkBytes: getTrackArtworkAsBytes(state),
        isLoading: isArtworkLoading(state),
        hasBytes: activeTrackHasArtworkBytes(state),
        fadeColor: getArtworkDominantColor(state),
      ),
      builder: (context, vm) {
        return Conditional.single(
          when: !vm.isLoading && vm.hasBytes,
          render: () => ArtworkScreen(
            bytes: vm.artworkBytes,
            fadeColor: vm.fadeColor,
          ),
          fallback: () => ArtworkPlaceholder(
            isAnimated: vm.isLoading,
          ),
        );
      },
    );
  }
}

@immutable
class _ViewModel {
  final bool isLoading;
  final bool hasBytes;
  final List<int> artworkBytes;
  final Color fadeColor;

  _ViewModel({
    @required this.artworkBytes,
    @required this.isLoading,
    @required this.fadeColor,
    @required this.hasBytes,
  });

  @override
  bool operator ==(other) {
    return other.isLoading == isLoading &&
        other.artworkBytes == artworkBytes &&
        other.hasBytes == hasBytes &&
        other.fadeColor == fadeColor;
  }

  @override
  int get hashCode => super.hashCode;
}

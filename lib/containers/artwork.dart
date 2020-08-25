import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/utils/connector.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/views/artwork_placeholder.dart';
import 'package:flyrics/views/artwork_screen.dart';
import 'package:flyrics/models/app_state.dart';

class Artwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector<_ViewModel>(
      converter: (Store<AppState> store) {
        return _ViewModel(
          artworkBytes: getTrackArtworkAsBytes(store.state),
          isLoading: isArtworkLoading(store.state),
          isArtworkMissing: isArtworkMissing(store.state),
          fadeColor: getArtworkDominantColor(store.state),
        );
      },
      builder: (context, vm) {
        return vm.isLoading
            ? ArtworkPlaceholder()
            : ArtworkScreen(
                bytes: vm.artworkBytes,
                fadeColor: vm.fadeColor ?? UI.primaryColor,
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

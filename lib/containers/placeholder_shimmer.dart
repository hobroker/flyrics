import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/utils/connector.dart';
import 'package:flyrics/views/placeholder_shimmer_screen.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/models/app_state.dart';

class PlaceholderShimmer extends StatelessWidget {
  final double height;
  final double width;

  const PlaceholderShimmer({
    Key key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Connector<_ViewModel>(
      converter: (Store<AppState> store) {
        return _ViewModel(
          backgroundColor: getArtworkColorByIndex(store.state, 1),
          shineColor: getArtworkColorByIndex(store.state, 2),
        );
      },
      builder: (context, vm) {
        return PlaceholderShimmerScreeen(
          backgroundColor: vm.backgroundColor,
          shineColor: vm.shineColor,
          width: width,
          height: height,
        );
      },
    );
  }
}

@immutable
class _ViewModel {
  final Color backgroundColor;
  final Color shineColor;

  _ViewModel({
    @required this.backgroundColor,
    @required this.shineColor,
  });

  @override
  bool operator ==(other) {
    return other.backgroundColor == backgroundColor &&
        other.shineColor == shineColor;
  }

  @override
  int get hashCode => super.hashCode;
}

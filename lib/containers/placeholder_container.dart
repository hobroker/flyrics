import 'package:flutter/material.dart';
import 'package:flyrics/selectors/placeholder.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/views/placeholder_shimmer_screen.dart';

class PlaceholderContainer extends StatelessWidget {
  final double height;
  final double width;
  final bool isAnimated;

  const PlaceholderContainer({
    Key key,
    this.height,
    this.width,
    this.isAnimated = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: (store) => _ViewModel(
        backgroundColor: getPlaceholderBgColor(store.state),
        shineColor: getPlaceholderFgColor(store.state),
      ),
      builder: (context, vm) {
        return PlaceholderShimmerScreeen(
          backgroundColor: vm.backgroundColor,
          shineColor: vm.shineColor,
          width: width,
          height: height,
          isAnimated: isAnimated,
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

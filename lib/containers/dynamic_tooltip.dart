import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/store/connector.dart';

class DynamicTooltip extends StatelessWidget {
  final String message;
  final Widget child;

  const DynamicTooltip({
    Key key,
    @required this.message,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Connector.state(
      converter: (state) => _ViewModel(
        backgroundColor: resolveArtworkTextColor(state),
        textColor: resolvedDominantColor(state),
      ),
      builder: (context, vm) {
        return Tooltip(
          message: message,
          child: child,
          verticalOffset: 16,
          textStyle: TextStyle(
            color: vm.textColor,
            height: 1,
          ),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: vm.backgroundColor,
          ),
        );
      },
    );
  }
}

@immutable
class _ViewModel {
  final Color backgroundColor;
  final Color textColor;

  _ViewModel({
    @required this.backgroundColor,
    @required this.textColor,
  });

  @override
  bool operator ==(other) {
    return other.backgroundColor == backgroundColor &&
        other.textColor == textColor;
  }

  @override
  int get hashCode => super.hashCode;
}

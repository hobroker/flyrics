import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/views/lyrics/genius_redirect.dart';

class GeniusRedirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: (state) => _ViewModel(
        url: getArtworkUrl(state),
        textColor: getArtworkTextColor(state),
      ),
      builder: (context, vm) {
        return GeniusRedirectScreen(
          url: vm.url,
          iconColor: vm.textColor,
        );
      },
    );
  }
}

@immutable
class _ViewModel {
  final String url;
  final Color textColor;

  _ViewModel({
    @required this.url,
    @required this.textColor,
  });

  @override
  bool operator ==(other) {
    return other.url == url && other.textColor == textColor;
  }

  @override
  int get hashCode => super.hashCode;
}

import 'package:flutter/material.dart';
import 'package:flyrics/actions/app_actions.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/selectors/lyrics.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/utils/conditional.dart';
import 'package:flyrics/views/empty_widget.dart';
import 'package:flyrics/views/genius_redirect.dart';

class GeniusRedirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: (store) {
        var url = getLyricsUrl(store.state);

        return _ViewModel(
          url: url,
          textColor: resolveArtworkTextColor(store.state),
          openUrl: () => store.dispatch(OpenUrlAction(url)),
        );
      },
      builder: (context, vm) {
        return Conditional.single(
          when: vm.url != null,
          render: () => GeniusRedirectScreen(
            openUrl: vm.openUrl,
            iconColor: vm.textColor,
          ),
          fallback: () => EmptyWidget(),
        );
      },
    );
  }
}

@immutable
class _ViewModel {
  final String url;
  final Color textColor;
  final Function openUrl;

  _ViewModel({
    @required this.url,
    @required this.textColor,
    @required this.openUrl,
  });

  @override
  bool operator ==(other) {
    return other.url == url && other.textColor == textColor;
  }

  @override
  int get hashCode => super.hashCode;
}

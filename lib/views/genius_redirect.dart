import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/player_store.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:flyrics/utils/o.dart';
import 'package:flyrics/views/empty_widget.dart';
import 'package:flyrics/views/hover_builder.dart';
import 'package:flyrics/views/icons/genius_icon.dart';
import 'package:flyrics/views/primary_tooltip.dart';

class GeniusRedirect extends StatelessWidget {
  final _player = I<PlayerStore>();

  @override
  Widget build(BuildContext context) {
    return O.branch(
      () => isNull(_player.search.activeResultUrl),
      () => EmptyWidget(),
      () => LayoutBuilder(builder: (context, constraints) {
        var height = constraints.maxHeight;

        return PrimaryTooltip(
          message: FlutterI18n.translate(context, 'lyrics.open_in_browser'),
          child: HoverBuilder<double>(
            value: 0.5,
            onEnter: (double opacity) => 1.0,
            builder: (BuildContext context, double opacity) {
              return AnimatedOpacity(
                opacity: opacity,
                duration: UX.transitionDuration,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(
                    maxWidth: height,
                    maxHeight: height,
                  ),
                  icon: GeniusIcon(),
                  onPressed: _player.search.openActiveResultInBrowser,
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

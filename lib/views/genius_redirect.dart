import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/provider.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:flyrics/views/hover_builder.dart';
import 'package:flyrics/views/icons/genius_icon.dart';
import 'package:flyrics/views/primary_tooltip.dart';

class GeniusRedirect extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _player = usePlayerStore();

    return O.when(
      () => isNotNull(_player.search.activeResultUrl),
      () => LayoutBuilder(builder: (context, constraints) {
        final size = constraints.maxHeight;

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
                    maxWidth: size,
                    maxHeight: size,
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

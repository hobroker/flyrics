import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:flyrics/views/genius_redirect_tooltip.dart';
import 'package:flyrics/views/hover_builder.dart';
import 'package:flyrics/views/icons/genius_icon.dart';

class GeniusRedirect extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _player = usePlayerStore();
    final ux = useUX();

    return O.when(
      () => isNotNull(_player.search.activeResultUrl),
      () => LayoutBuilder(builder: (context, constraints) {
        final size = constraints.maxHeight;

        return GeniusRedirectTooltip(
          child: HoverBuilder<double>(
            value: 0.5,
            onEnter: (double opacity) => 1.0,
            builder: (BuildContext context, double opacity) {
              return AnimatedOpacity(
                opacity: opacity,
                duration: ux.transitionDuration,
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

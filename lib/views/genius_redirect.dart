import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/hooks/translate.dart';
import 'package:flyrics/modules/mobx/o.dart';
import 'package:flyrics/views/hover_builder.dart';
import 'package:flyrics/views/icons/genius_icon.dart';
import 'package:flyrics/views/primary_tooltip.dart';

class GeniusRedirect extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final t = useI18n();
    final ux = useUX();
    final lyrics = useLyricsStore();

    return O.when(
      () => lyrics.selectedSearchItemUrl != null,
      () => LayoutBuilder(builder: (context, constraints) {
        final size = constraints.maxHeight;

        return PrimaryTooltip(
          message: t('lyrics.open_in_browser'),
          child: HoverBuilder<double>.toggle(
            initialState: 0.5,
            toggleTo: 1.0,
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
                  onPressed: lyrics.openSelectedItemInBrowser,
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

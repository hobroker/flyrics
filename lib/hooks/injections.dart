import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/services/ux.dart';
import 'package:flyrics/stores/player.dart';
import 'package:jab/jab.dart';

T useInjection<T>() => Jab.get<T>(useContext());

final useUX = () => useInjection<UX>();

final usePlayerStore = () => useInjection<PlayerStore>();

final useTrackStore = () => usePlayerStore().track;

final useArtworkStore = () => usePlayerStore().artwork;

final useLyricsStore = () => usePlayerStore().lyrics;

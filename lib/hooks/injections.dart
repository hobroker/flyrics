import 'package:flyrics/hooks/use_injection.dart';
import 'package:flyrics/services/ux.dart';
import 'package:flyrics/stores/player.dart';
import 'package:flyrics/stores/theme.dart';

final useUX = () => useInjection<UX>();

final usePlayerStore = () => useInjection<PlayerStore>();

final useTrackStore = () => usePlayerStore().track;

final useArtworkStore = () => usePlayerStore().artwork;

final useLyricsStore = () => usePlayerStore().lyrics;

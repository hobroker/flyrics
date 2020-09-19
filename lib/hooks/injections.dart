import 'package:flyrics/hooks/use_injection.dart';
import 'package:flyrics/services/ux.dart';
import 'package:flyrics/stores/player.dart';

final useUX = () => useInjection<UX>();

final usePlayerStore = () => useInjection<PlayerStore>();

final useTrackStore = () => usePlayerStore().track;

final useArtworkStore = () => usePlayerStore().artwork;

final useColorStore = () => usePlayerStore().color;

final useLyricsStore = () => usePlayerStore().lyrics;

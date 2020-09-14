import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/hooks/use_injection.dart';
import 'package:flyrics/stores/artwork.dart';
import 'package:flyrics/stores/lyrics.dart';
import 'package:flyrics/stores/player.dart';
import 'package:flyrics/stores/track.dart';

UX useUX() => useInjection<UX>();

PlayerStore usePlayerStore() => useInjection<PlayerStore>();

TrackStore useTrackStore() => usePlayerStore().track;

ArtworkStore useArtworkStore() => usePlayerStore().artwork;

LyricsStore useLyricsStore() => usePlayerStore().lyrics;

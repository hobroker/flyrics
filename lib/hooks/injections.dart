import 'package:flyrics/api/api.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/hooks/use_injection.dart';
import 'package:flyrics/stores/player.dart';
import 'package:flyrics/stores/track.dart';

Api useApi() => useInjection<Api>();

UX useUX() => useInjection<UX>();

PlayerStore usePlayerStore() => useInjection<PlayerStore>();

TrackStore useTrackStore() => usePlayerStore().track;

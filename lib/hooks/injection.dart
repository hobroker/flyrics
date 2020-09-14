import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/modules/injection/injection.dart';
import 'package:flyrics/stores/player.dart';
import 'package:flyrics/stores/track.dart';

T useInjection<T>() => Injection.get<T>(useContext());

PlayerStore usePlayerStore() => useInjection<PlayerStore>();

TrackStore useTrackStore() => usePlayerStore().track;

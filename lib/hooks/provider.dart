import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/stores/player.dart';
import 'package:flyrics/stores/track.dart';
import 'package:provider/provider.dart';

T useProvider<T>() => Provider.of<T>(useContext());

PlayerStore usePlayerStore() => useProvider<PlayerStore>();

TrackStore useTrackStore() => useProvider<PlayerStore>().track;

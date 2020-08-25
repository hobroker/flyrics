import 'package:flyrics/models/app_state.dart';

bool isSpotifyRunning(AppState state) => state.isRunning;

bool isRefreshTimerRunning(AppState state) => state.timer.refreshTrack;

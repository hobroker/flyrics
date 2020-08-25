import 'package:flyrics/models/state/app_state.dart';

bool isPlayerRunning(AppState state) => state.player.isRunning;

bool isRefreshTimerRunning(AppState state) => state.timer.refreshTrack;

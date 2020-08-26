import 'package:flyrics/models/state/app_state.dart';

bool isCheckIsRunningTimerActive(AppState state) => state.timer.checkIsRunning;

bool isRefreshTrackTimerActive(AppState state) => state.timer.refreshTrack;

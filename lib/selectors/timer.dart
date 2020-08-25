import 'package:flyrics/models/state/app_state.dart';

bool checkIsRunningTimerActive(AppState state) => state.timer.checkIsRunning;

bool isRefreshTrackTimerActive(AppState state) => state.timer.refreshTrack;

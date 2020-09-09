import 'package:built_collection/built_collection.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/models/state/track_state.dart';
import 'package:flyrics/models/track.dart';
import 'package:flyrics/modules/store/reducer_util.dart';
import 'package:redux/redux.dart';

final _isLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, FetchTrackStartAction>(reduceTrue),
  TypedReducer<bool, FetchTrackSuccessAction>(reduceFalse),
]);

final _activeIdReducer = combineReducers<String>([
  TypedReducer<String, FetchTrackSuccessAction>(
      (state, action) => action.track.id),
  TypedReducer<String, ResetActiveIdAction>(reduceAlways(null)),
]);

final _lastActiveIdReducer = combineReducers<String>([
  TypedReducer<String, FetchTrackSuccessAction>(
      (state, action) => action.lastActiveId),
  TypedReducer<String, ResetActiveIdAction>(reduceAlways(null)),
]);

final _byIdReducer = combineReducers<MapBuilder<String, Track>>([
  TypedReducer<MapBuilder<String, Track>, FetchTrackSuccessAction>(
      (state, action) => state..[action.track.id] = action.track),
]);

final trackReducer = (TrackStateBuilder state, action) => TrackStateBuilder()
  ..isLoading = _isLoadingReducer(state.isLoading, action)
  ..activeId = _activeIdReducer(state.activeId, action)
  ..lastActiveId = _lastActiveIdReducer(state.lastActiveId, action)
  ..byId = _byIdReducer(state.byId, action);

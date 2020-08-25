import 'package:flyrics/models/search_result_model.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/models/state/search_state.dart';
import 'package:flyrics/selectors/track.dart';

String getSearchQuery(AppState state) {
  var name = getTrackName(state);
  var artist = getTrackArtist(state);

  return '$artist $name';
}

SearchState getSearchState(AppState state) => state.search;

SearchResultModel getFirstSearchResult(AppState state) =>
    getSearchState(state).results.first;

String getFirstSearchResultUrl(AppState state) =>
    getFirstSearchResult(state).url;

import 'package:flyrics/models/search_result.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/models/state/search_state.dart';
import 'package:flyrics/selectors/track.dart';

String getSearchQuery(AppState state) {
  var name = getTrackName(state);
  var artist = getTrackArtist(state);

  return '$artist $name';
}

SearchState getSearchState(AppState state) => state.search;

bool searchHasResults(AppState state) => state.search.results.isNotEmpty;

SearchResult getFirstSearchResult(AppState state) =>
    searchHasResults(state) ? getSearchState(state).results.first : null;

String getFirstSearchResultUrl(AppState state) =>
    getFirstSearchResult(state)?.url;

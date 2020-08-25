import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/selectors/track.dart';

String getSearchQuery(AppState state) {
  var name = getTrackName(state);
  var artist = getTrackArtist(state);

  return '$artist $name';
}

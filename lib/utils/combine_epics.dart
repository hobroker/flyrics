import 'package:redux_epics/redux_epics.dart';
import 'package:async/async.dart' show StreamGroup;

Epic<State> combineManyEpics<State>(List<Epic<State>> epics) {
  return (Stream<dynamic> actions, EpicStore<State> store) {
    return StreamGroup.merge(
        epics.map((epic) => epic(actions, store)).toList());
  };
}

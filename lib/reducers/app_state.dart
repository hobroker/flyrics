import 'package:flyrics/models/app_state.dart';

import 'counter_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    counter: counterReducer(state.counter, action),
  );
}

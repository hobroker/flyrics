bool Function(bool, dynamic) reduceTrue = (state, action) => true;

bool Function(bool, dynamic) reduceFalse = (state, action) => false;

bool Function(bool, dynamic) reducePayload = (state, action) => action.payload;

T Function(T, dynamic) reduceAlways<T>(T value) => (T state, action) => value;

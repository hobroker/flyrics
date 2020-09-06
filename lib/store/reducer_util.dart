bool Function(bool, dynamic) reduceTrue = (state, action) => true;

bool Function(bool, dynamic) reduceFalse = (state, action) => false;

T Function(T, dynamic) reduceAlways<T>(T value) => (T state, action) => value;

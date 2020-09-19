Null Function() noop = () {};

bool Function(dynamic, dynamic) notEqual = (a, b) => a != b;

bool Function(dynamic) not = (value) => value is bool ? !value : value == null;

bool Function(dynamic) isNotNull = (value) => value != null;

bool Function(dynamic) isNull = (value) => value == null;

T identity<T>(T value) => value;

dynamic Function(dynamic) Function(dynamic) apply =
    (fn) => (value) => fn(value);

Null Function() noop = () {};

bool Function(dynamic, dynamic) notEqual = (a, b) => a != b;

bool Function(dynamic) isNotNull = (value) => value != null;

bool Function(dynamic) isNull = (value) => value == null;

Function(dynamic) identity = (value) => value;

dynamic Function(dynamic) Function(dynamic) apply =
    (fn) => (value) => fn(value);

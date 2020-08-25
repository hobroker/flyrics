import 'dart:collection';

extension ImmutableHashMapExtension<K, V> on HashMap<K, V> {
  HashMap clone() => HashMap<K, V>.from(this);

  HashMap updateValues(Map<K, Function(V)> setters) {
    var newMap = clone();
    setters.forEach((key, fn) {
      var value = newMap[key];
      newMap[key] = fn(value);
    });

    return newMap;
  }

  HashMap updateValue(K key, Function(V) fn) {
    var newMap = clone();
    var value = newMap[key];
    newMap[key] = fn(value);

    return newMap;
  }

  HashMap setValue(K key, V value) {
    var newMap = clone();
    newMap[key] = value;

    return newMap;
  }
}

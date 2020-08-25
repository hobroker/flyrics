import 'dart:collection';

HashMap<K, V> updateMap<K, V>(HashMap<K, V> map, Map<K, Function(V)> setters) {
  var newMap = HashMap<K, V>.from(map);
  setters.forEach((key, fn) {
    newMap[key] = fn(newMap[key]);
  });

  return newMap;
}

HashMap<K, V> setMapValue<K, V>(HashMap<K, V> map, K key, V value) {
  var newMap = HashMap<K, V>.from(map);
  newMap[key] = value;

  return newMap;
}

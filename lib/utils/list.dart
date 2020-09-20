List generateListOf<T>(int length, Function(int index) generator) =>
    List<T>.generate(length, generator, growable: false);

List insertBetween<T>(List<T> list, T item) {
  final length = list.length;
  var i = 0;
  while (i < length * 2 - 2) {
    i++;
    list.insert(i, item);
    i++;
  }

  return list;
}

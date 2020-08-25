bool keyValueEq(Map map) {
  for (var entry in map.entries) {
    if (entry.key != entry.value) {
      return false;
    }
  }

  return true;
}

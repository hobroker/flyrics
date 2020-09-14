List generateListOf<T>(int length, Function(int index) generator) =>
    List<T>.generate(length, generator, growable: false);

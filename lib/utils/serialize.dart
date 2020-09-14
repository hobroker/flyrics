List<T> deserializeListOf<T>(
  List<Map<String, dynamic>> list,
  Function(Map<String, dynamic>) callback,
) =>
    List<T>.from(list.map(callback), growable: false);

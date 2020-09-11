import 'dart:convert';

import 'package:flutter/foundation.dart';

class AppLogger {
  List<_LogItem> _logItems = [];

  AppLogger();

  void log(
    LogType type, {
    String message,
    dynamic extra,
  }) {
    _logItems.add(_LogItem(
      type: type,
      message: message,
      dateTime: DateTime.now(),
      extra: extra,
    ));
  }

  void logError(error) {
    _logItems.add(_LogItem(
      type: LogType.error,
      message: 'Error',
      dateTime: DateTime.now(),
      extra: error,
    ));
  }

  Future dump() async {
    final data = json.encode(_logItems);
    debugPrint('AppLogger dump: ${data}');
  }

  void reset() {
    _logItems = [];
  }
}

class _LogItem {
  final LogType type;
  final String message;
  final DateTime dateTime;
  final dynamic extra;

  _LogItem({
    this.type,
    this.message,
    this.dateTime,
    this.extra,
  });

  Map toJson() => {
        'type': type.toString(),
        'message': message,
        'dateTime': dateTime.toString(),
        'extra': extra.toString(),
      };
}

enum LogType { info, error, warning }

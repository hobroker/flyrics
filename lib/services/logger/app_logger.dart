import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flyrics/services/logger/log_entry.dart';

@immutable
class AppLogger {
  final List<LogEntry> _logItems = [];

  AppLogger();

  void log(
    LogType type, {
    String message,
    dynamic extra,
  }) {
    _logItems.add(LogEntry(
      type: type,
      message: message,
      dateTime: DateTime.now(),
      extra: extra,
    ));
  }

  void logError(error) {
    _logItems.add(LogEntry(
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
    _logItems.clear();
  }
}
